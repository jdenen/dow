def rubies = ["2.1.6", "2.2.2"]
def platforms = ["osx", "linux-x86", "linux-x86_64"]

rubies.each { ruby ->
  job("ruby-${ruby}-unit-test") {
    description("Unit test against Ruby version ${ruby}")

    scm {
      git {
	remote {
	  github("jdenen/dow")
	}
	extensions {
	  cleanBeforeCheckout()
	}
      }
    }

    triggers {
      scm("H/5 * * * *")
    }

    wrappers {
      rbenv("${ruby}") {
	ignoreLocalVersion()
	gems("bundler", "rake")
      }
    }

    steps {
      shell("bundle check || bundle install")
      shell("bundle exec rspec -f RspecJunitFormatter -o result/ruby-${ruby}-unit-test.xml -f progress")
    }

    publishers {
      archiveJunit("result/*.xml")
      mailer('', true, true)
    }
    
    platforms.each { pf ->
      publishers {
        downstream("ruby-${ruby}-${pf}-build", "SUCCESS")
      }
    }  
  }

  platforms.each { pf ->
    job("ruby-${ruby}-${pf}-build") {
      description("Build for Ruby ${ruby} on ${pf}")

      scm {
	git {
	  remote {
	    github("jdenen/dow")
	  }
	  extensions {
	    cleanBeforeCheckout()
	  }
	}
      }

      steps {
        shell("curl -L -O --fail http://d6r77u77i8pq3.cloudfront.net/releases/traveling-ruby-20150715-${ruby}-${pf}.tar.gz")
        shell("mkdir -p dow-${ruby}-${pf}/lib/ruby")
        shell("tar -xzf traveling-ruby-20150715-${ruby}-${pf}.tar.gz -C dow-${ruby}-${pf}/lib/ruby")
        shell("mv lib/* dow-${ruby}-${pf}/lib")
        shell("cp wrapper.sh dow-${ruby}-${pf}/dow")
        shell("tar -czf dow-${ruby}-${pf}.tar.gz dow-${ruby}-${pf}")
      }
      
      publishers {
        archiveArtifacts {
          pattern("dow-${ruby}-${pf}.tar.gz")
          onlyIfSuccessful
	}
        mailer('', true, true)
      }
    }
  }
}
