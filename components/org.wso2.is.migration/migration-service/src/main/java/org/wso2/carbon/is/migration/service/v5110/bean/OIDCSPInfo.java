/*
 * Copyright (c) 2020, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.wso2.carbon.is.migration.service.v5110.bean;

/**
 * OIDC Service Provider Info.
 */
public class OIDCSPInfo {

    private String consumerKey;
    private int tenantID;

    public OIDCSPInfo(String consumerKey, int tenantID) {

        this.consumerKey = consumerKey;
        this.tenantID = tenantID;
    }

    public String getConsumerKey() {

        return consumerKey;
    }

    public int getTenantID() {

        return tenantID;
    }
}
