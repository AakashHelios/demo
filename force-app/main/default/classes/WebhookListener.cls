@RestResource(urlMapping='/webhookListener/*')
global class WebhookListener {

    @HttpPost
    global static void handlePost(String requestBody) {
        // Process the incoming payload here
        // For example, parse JSON payload and trigger actions
        
        System.debug('Received POST request body: ' + requestBody);
        
        // Example: Parse JSON payload
        Map<String, Object> payloadMap = (Map<String, Object>)JSON.deserializeUntyped(requestBody);
        
        // Example: Extract data from payload
        String commitMessage = (String)payloadMap.get('commit_message');
        String repositoryName = (String)payloadMap.get('repository_name');
        // Extract other relevant data
        
        // Perform actions based on the payload data
        // For example, create a task or trigger a notification
        // Your logic goes here
        
        // Example: Create a Task
        Task newTask = new Task();
        newTask.Subject = 'New Commit on ' + repositoryName;
        newTask.Description = 'Commit Message: ' + commitMessage;
        // Set other task fields
        
        insert newTask;
        
        // You can add more handling or notifications based on your requirements
    }
}
