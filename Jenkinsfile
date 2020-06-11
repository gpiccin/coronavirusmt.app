@Library('heelal-jenkins-library@master') _
pipeline {
  agent any
  environment {
    ZIP_FILE = "coronavirusmt.web.app.build.zip"
  }
  stages { 
    stage('Backup'){
      steps{
        heelalSiteBackup(
            folder: "coronavirusmt.app"
        )
      }
    }
    stage('Publish') {
      steps {
        heelalSitePublish(
            folder: "coronavirusmt.app",
            zipFile: "$ZIP_FILE"
        )
        heelalReloadProxy()
      }
    }
    // stage('Reload proxy') {
    //   steps {
    //     heelalReloadProxy()
    //   }
    // }
  }
}