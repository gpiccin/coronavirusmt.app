@Library('heelal-jenkins-library@master') _
pipeline {
  agent any
  environment {
    ZIP_FILE = "web-release/coronavirusmt.app.zip"
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
        heelalConfigureProxy(
            folder: "coronavirusmt.app",
            file: "coronavirusmt.app.conf"
        )
      }
    }
    stage('Reload proxy') {
      steps {
        heelalReloadProxy()
      }
    }
  }
}