package com.dlombard.cesperance;

import com.mongodb.client.MongoClient;
import com.mongodb.stitch.android.core.Stitch;
import com.mongodb.stitch.android.core.StitchAppClient;
import com.mongodb.stitch.android.services.mongodb.local.LocalMongoDbService;

public class _Stitch {
    private static StitchAppClient client;
    private MongoClient mongoClient;

    _Stitch(){
        if(!Stitch.hasAppClient("cesperanceapp-iivvt")){
            this.client =
                    Stitch.initializeDefaultAppClient("cesperanceapp-iivvt");
        }

        this.mongoClient = this.client.getServiceClient(LocalMongoDbService.clientFactory);

    }


    public StitchAppClient getClient() {
        return client;
    }

    public void setClient(StitchAppClient client) {
        this.client = client;
    }

    public MongoClient getMongoClient() {
        return this.mongoClient;
    }

    public void setMongoClient(MongoClient mongoClient) {
        this.mongoClient = mongoClient;
    }



}
