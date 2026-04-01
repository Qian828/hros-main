package com.hros.model;

import java.io.Serializable;
import java.util.Date;

public class Handover implements Serializable {
    private Integer id;

    /**
     * 交接人
     *
     * @mbg.generated
     */
    private Integer handoverBy;

    /**
     * 接收人
     *
     * @mbg.generated
     */
    private Integer receiveBy;

    /**
     * 交接时间
     *
     * @mbg.generated
     */
    private Date handoverTime;

    /**
     * 备注
     *
     * @mbg.generated
     */
    private String remark;

    private Date createTime;

    /**
     * 交接物品，逗号分隔
     *
     * @mbg.generated
     */
    private String itemNames;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getHandoverBy() {
        return handoverBy;
    }

    public void setHandoverBy(Integer handoverBy) {
        this.handoverBy = handoverBy;
    }

    public Integer getReceiveBy() {
        return receiveBy;
    }

    public void setReceiveBy(Integer receiveBy) {
        this.receiveBy = receiveBy;
    }

    public Date getHandoverTime() {
        return handoverTime;
    }

    public void setHandoverTime(Date handoverTime) {
        this.handoverTime = handoverTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getItemNames() {
        return itemNames;
    }

    public void setItemNames(String itemNames) {
        this.itemNames = itemNames;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", handoverBy=").append(handoverBy);
        sb.append(", receiveBy=").append(receiveBy);
        sb.append(", handoverTime=").append(handoverTime);
        sb.append(", remark=").append(remark);
        sb.append(", createTime=").append(createTime);
        sb.append(", itemNames=").append(itemNames);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}