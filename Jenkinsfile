pipeline {
  agent none
  environment {
    DOCKER_IMAGE = "pixiu_store"
    DOCKER_TAG="${ENVIRONMENT}-${GIT_COMMIT}"
  }
  stages {
    stage('Remove existing containers') {
      agent any
      steps {
        sh 'if [ "$(docker ps -a -q)" ]; then docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q); fi'
      }
    }
    stage('Build') {
      agent any
      steps {
        sh 'docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .'
      }
    }
    stage('Run') {
      agent any
      steps {
        sh 'docker run -d --rm -it --network net-global --name pixiu_store -p 80:80 ${DOCKER_IMAGE}:${DOCKER_TAG}'
        //clean to save disk
        sh "docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}"
      }
    }
  }
}
