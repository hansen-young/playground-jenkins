/* Requires the Docker Pipeline plugin */
pipeline {
    agent { 
        docker { 
            image 'python:3.10.18-slim'
            args  '--user=0' 
        } 
    }

    parameters {
        string(name: 'COVERAGE_THRESHOLD', defaultValue: '90', description: 'Minimum code coverage percentage required to pass the test stage.')
    }

    stages {
        stage('Run Test') {
            steps {
                sh 'pip install uv'
                sh 'uv sync --group test'
                sh 'chmod +x ./run_test.sh'
                sh './run_test.sh ${COVERAGE_THRESHOLD}'
            }
            post {
                failure {
                    echo "Test stage failed."
                }
            }
        }
    }
}