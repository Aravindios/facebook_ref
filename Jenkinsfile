node {
    stage('Checkout/Build/Test') {
        // Checkout files.
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
                name: 'facebook_ref',
                url: 'https://github.com/Aravindios/facebook_ref/'
            ]]
        ])

        // Build and Test
        sh 'xcodebuild -workspace facebook_ref.xcworkspace -scheme "facebook_ref" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 6,OS=11.2" -enableCodeCoverage YES | /usr/local/bin/ocunit2junit' 

        // Publish test results.
        step([$class: 'JUnitResultArchiver', allowEmptyResults: true, testResults: 'test-reports/*.xml'])
    }	

	// Generate Code Coverage report
	sh '/usr/local/bin/slather coverage --jenkins --html --scheme facebook_ref facebook_ref.xcodeproj/'
	}

	// Publish coverage results
	publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'html', reportFiles: 'index.html', reportName: 'Coverage Report'])
