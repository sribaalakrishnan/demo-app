pipeline {
  agent any
  tools { maven 'Maven3' }
  parameters {
    choice(name: 'ENV', choices: ['dev','qa','prod'])
    booleanParam(name: 'RUN_TESTS', defaultValue: true)
  }
  stages {
    stage('Build') {
      steps { sh 'mvn -B clean package -DskipTests' }
    }
    stage('Test') {
      when { expression { params.RUN_TESTS } }
      steps { sh 'mvn -B test' }
    }
    stage('Deploy') {
      steps { echo "Deploying to ${params.ENV}" }
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
