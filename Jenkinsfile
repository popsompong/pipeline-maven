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
                    echo "***************************"
                    echo "** Building jar ***********"
                    echo "***************************"
                    docker run --rm  -v $WORKSPACE/java-app:/app -v $HOME/.m2:/root/.m2 -w /app maven mvn -B -DskipTests clean package
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
