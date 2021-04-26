pipeline {
  agent none
  environment {
    DOCKER_IMAGE = "pixiu_store_image"
    DOCKER_TAG="${ENVIRONMENT}-${GIT_COMMIT}"
  }
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'docker build -t ${DOCKER_IMAGE} .'
      }
    }
    stage('Deploy') {
      agent any
      steps {
        sh 'docker run -d --rm -it --network net-global --name pixiu_store -p 8000:80 ${DOCKER_IMAGE}'
        //clean to save disk
        sh "docker image rm ${DOCKER_IMAGE} -f"
      }
    }
  }
}
