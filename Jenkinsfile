//SCRIPTED

//DECLARATIVE
pipeline {
	agent any
	//agent { docker { image 'maven:3.6.3'} }
	//agent { docker { image 'node:13.8'} }

	environment {
		dockerHome = tool 'myDocker'
		mavenHome = tool 'myMaven'
		PATH = "$dockerHome/bin:$mavenHome/bin:$PATH"
	}

	stages {
		stage('Build') {
			steps {
				sh 'mvn --version'
				sh 'docker version'
				//sh 'node --version'
				echo "Build"
				echo "PATH - $PATH"
				echo "BUILD_NUMBER - $env.BUILD_NUMBER"
				echo "BUILD_ID - $env.BUILD_ID"
				echo "BUILD_TAG - $env.BUILD_TAG"
				echo "BUILD_URL - $env.BUILD_URL"
				echo "JOB_NAME - $env.JOB_NAME"
			}
		}

		stage('Compile') {
			steps {
				echo "Compile"
				sh 'mvn clean compile'
			}
		}

		stage('Test') {
			steps {
				echo "Test"	
				sh "mvn test"
			}
		}

		stage('Integration Test') {
			steps {
				echo "Integration Test"
				sh "mvn failsafe:integration-test failsafe:verify"
			}
		}

		stage('Package') {
			steps {
				echo "Package"
				sh "mvn package -DskipTests"
			}
		}

		stage('Build Docker Image') {
			steps {
				// docker build - t "nlnguyen115/currency-exchange-devops:$env.BUILD_TAG"
				script {
					dockerImage = docker.build("nlnguyen115/currency-exchange-devops:${env.BUILD_TAG}")
				}
			}
		}

		stage('Push Docker Image') {
			steps {
				script {
					docker.withRegistry('', 'dockerhub') {
						dockerImage.push();
						dockerImage.push('latest');
					}
				}
			}
		}
	}

	post {
		always {
			echo 'Procesing end with ...'
		}

		success {
			echo ' >>> success'
		}

		failure {
			echo ' >>> fail'
		}
	}
}
