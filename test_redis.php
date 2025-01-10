<?php
try {
    $redis = new Redis();
    $redis->connect('136.228.158.126', 5467);
    
    // Authenticate with password
    $redis->auth('Admin@12345');
    
    echo "Connected to Redis successfully";
    
    // Optional: Test a simple operation
    $redis->set("test_key", "Hello, Redis!");
    $value = $redis->get("test_key");
    echo "\nRetrieved value: " . $value;
} catch (Exception $e) {
    echo "Couldn't connect to Redis: " . $e->getMessage();
}