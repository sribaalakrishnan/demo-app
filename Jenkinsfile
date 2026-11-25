pipeline {
  agent any
  tools { maven 'Maven3' }
  stages {
    stage('Build') {
      steps { sh 'mvn -B clean package -DskipTests' }
    }
    stage('Test') {
      steps { sh 'mvn -B test' }
    }
  }
  post {
    always {
      junit allowEmptyResults: true,
        testResults: 'target/surefire-reports/*.xml'
    }
    success { archiveArtifacts 'target/*.jar' }
  }
}
