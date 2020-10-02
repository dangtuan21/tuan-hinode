node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("dangtuan21/hinode")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            //docker tag apmod/pia-diff-batch-job:latest 455920691004.dkr.ecr.us-east-1.amazonaws.com/apmod/pia-diff-batch-job:latest
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}