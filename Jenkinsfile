pipeline {
  agent none
  environment {
    DOCKER_IMAGE = "pixiu_store"
    DOCKER_TAG="${ENVIRONMENT}-${GIT_COMMIT}"
  }
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
      }
    }
    stage('Deploy') {
      agent any
      steps {
        sh 'docker run -d --rm -it --network net-global --name pixiu_store -p 80:80 ${DOCKER_IMAGE}:${DOCKER_TAG}'
        //clean to save disk
        sh "docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}"
      }
    }
  }
}
