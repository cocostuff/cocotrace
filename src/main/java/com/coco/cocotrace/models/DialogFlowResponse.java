package com.coco.cocotrace.models;

import lombok.Data;

@Data
public class DialogFlowResponse {
    private String responseId;
    private DialogFlowQueryResult queryResult;
    private String session;
}