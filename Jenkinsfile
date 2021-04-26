pipeline {
  agent none
  environment {
    DOCKER_CONTAINER = "pixiu_store"
    DOCKER_IMAGE = "pixiu_store_image"
    DOCKER_TAG="${ENVIRONMENT}-${GIT_COMMIT}"
  }
  parameters {
        gitParameter name: 'BRANCH_TAG', 
                     type: 'PT_BRANCH_TAG',
                     defaultValue: 'master'
  }
  stages {
	stage('Checkout') {
		agent any
		steps {
			checkout([$class: 'GitSCM', 
					  branches: [[name: "${params.BRANCH_TAG}"]], 
					  doGenerateSubmoduleConfigurations: false, 
					  extensions: [], 
					  gitTool: 'Default', 
					  submoduleCfg: [], 
					  userRemoteConfigs: [[url: 'https://github.com/jenkinsci/git-parameter-plugin.git']]
					])
		}
	}
    stage('Build') {
      agent any
      steps {
        sh 'docker build -t ${DOCKER_IMAGE} .'
      }
    }
    stage('Deploy') {
      agent any
      steps {
	    sh 'docker rm ${DOCKER_CONTAINER} -f'
        sh 'docker run -d --rm -it --network net-global --name ${DOCKER_CONTAINER} -p 8000:80 ${DOCKER_IMAGE}'
        //clean to save disk
        sh "docker image rm ${DOCKER_IMAGE} -f"
      }
    }
  }
}
