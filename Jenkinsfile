//SCRIPTED

//DECLARATIVE
pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				echo "Build"
			}
		}

		stage('Test') {
			steps {
				echo "Test"	
			}
		}

		stage('Integration Test') {
			steps {
				echo "Integration Test"
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
