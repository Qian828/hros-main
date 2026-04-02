package com.hros.model;

import com.fasterxml.jackson.annotation.JsonFormat;

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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date handoverTime;

    /**
     * 备注
     *
     * @mbg.generated
     */
    private String remark;

    /**
     * 创建人ID
     *
     * @mbg.generated
     */
    private Integer createBy;

    /**
     * 创建人姓名
     *
     * @mbg.generated
     */
    private String createByName;

    /**
     * 创建时间
     *
     * @mbg.generated
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
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

    public Integer getCreateBy() {
        return createBy;
    }

    public void setCreateBy(Integer createBy) {
        this.createBy = createBy;
    }

    public String getCreateByName() {
        return createByName;
    }

    public void setCreateByName(String createByName) {
        this.createByName = createByName;
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
        sb.append(", createBy=").append(createBy);
        sb.append(", createByName=").append(createByName);
        sb.append(", createTime=").append(createTime);
        sb.append(", itemNames=").append(itemNames);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}