package com.example.startupnamer;

import com.mongodb.stitch.android.core.Stitch;
import com.mongodb.stitch.android.core.StitchAppClient;
import com.mongodb.stitch.android.services.mongodb.remote.RemoteMongoClient;

public class _Stitch {
    private StitchAppClient client;
    private RemoteMongoClient mongoClient;

    _Stitch(){
        this.client =
                Stitch.initializeDefaultAppClient("cesperanceapp-iivvt");
        this.mongoClient = this.client.getServiceClient(RemoteMongoClient.factory, "mongodb-atlas");

    }


    public StitchAppClient getClient() {
        return client;
    }

    public void setClient(StitchAppClient client) {
        this.client = client;
    }

    public RemoteMongoClient getMongoClient() {
        return this.mongoClient;
    }

    public void setMongoClient(RemoteMongoClient mongoClient) {
        this.mongoClient = mongoClient;
    }



}
