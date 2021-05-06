pipeline {
  agent none
  environment {
    DOCKER_CONTAINER = "pixiu_store"
    DOCKER_IMAGE = "pixiu_store_image"
  }
  stages {
    stage('Build') {
      agent any
      steps {
	sh 'docker image rm ${DOCKER_IMAGE} -f'
        sh 'docker build -t ${DOCKER_IMAGE} .'
      }
    }
    stage('Deploy') {
      agent any
      steps {
	sh 'docker rm ${DOCKER_CONTAINER} -f'
        sh 'docker run -d --rm -it --network net-global --name ${DOCKER_CONTAINER} -p 8000:80 ${DOCKER_IMAGE}'
      }
    }
  }
}
