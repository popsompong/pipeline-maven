pipeline {

    agent any

    triggers {
        pollSCM "* * * * *"
    }

    environment {
        PASS = credentials('registry-pass')
    }

    stages {

        stage('Build') {
            steps {
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    '''
            }
            post {
                success {
                    archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                }
            }
        }

    }
}
