env.PATH = '/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Server.app/Contents/ServerRoot/usr/bin:/Applications/Server.app/Contents/ServerRoot/usr/sbin'
env.HOME = '/Users/iosbuilds'
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
    //   sh"fastlane"
//      sh "xcode-select --install"
  //    sh "gem install fastlane -NV"
 //   sh "brew cask install fastlane"
 //    sh "export LC_ALL=en_US.UTF-8"
  //    sh "export LANG=en_US.UTF-8" 
   //      sh "bundle install"
  //      sh "bundle exec fastlane store"
//   sh "fastlane init"   
  //   sh "bundle exec fastlane scan"
        
 sh "fastlane gym"
 sh "fastlane scan"      

    }
}
