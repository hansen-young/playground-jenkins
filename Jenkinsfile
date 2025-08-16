/* Requires the Docker Pipeline plugin */
pipeline {
    agent { docker { image 'python:3.13.6-alpine3.22' } }

    parameters {
        string(name: 'COVERAGE_THRESHOLD', defaultValue: '90', description: 'Minimum code coverage percentage required to pass the test stage.')
    }

    stages {
        stage('Run Test') {
            steps {
                sh 'pip install uv'
                sh 'uv sync --group test'
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