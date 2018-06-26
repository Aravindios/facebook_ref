   env.PATH = '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin'
env.apple = '/Users/iosbuilds'
env.USER = 'iosbuilds'
// backwards compat with old branch variable
env.GIT_BRANCH = env.BRANCH_NAME
 node {
    stage('Checkout/Build/Test') {
        // Checkout files.
        checkout([
            $class: 'GitSCM',
            branches: [[name: 'master']],
            doGenerateSubmoduleConfigurations: false,
            extensions: [], submoduleCfg: [],
            userRemoteConfigs: [[
                name: 'hannatest',
                url: 'https://github.com/Aravindios/facebook_ref.git'
            ]]
        ])
     //   sh 'gem install fastlane -NV' 
        sh 'fastlane init'    
        sh 'fastlane env' 
       

    }
 }
