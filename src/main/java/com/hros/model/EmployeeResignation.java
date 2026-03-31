package com.hros.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

public class EmployeeResignation implements Serializable {
    /**
     * 主键ID
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     * 员工ID（关联employee表）
     *
     * @mbg.generated
     */
    private Integer empId;

    /**
     * 离职类型 1:主动离职 2:被动离职
     *
     * @mbg.generated
     */
    private Byte resignType;

    /**
     * 离职原因
     *
     * @mbg.generated
     */
    private String resignReason;

    /**
     * 期望离职日期
     *
     * @mbg.generated
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date expectResignDate;

    /**
     * 审批人ID
     *
     * @mbg.generated
     */
    private Integer approverId;

    /**
     * 审批时间
     *
     * @mbg.generated
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date approveTime;

    /**
     * 审批意见
     *
     * @mbg.generated
     */
    private String approveRemark;

    /**
     * 状态 0:待审核 1:已通过 2:已驳回
     *
     * @mbg.generated
     */
    private Byte status;

    /**
     * 实际离职日期
     *
     * @mbg.generated
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private Date actualResignDate;

    /**
     * 创建时间
     *
     * @mbg.generated
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date createTime;

    /**
     * 更新时间
     *
     * @mbg.generated
     */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    private Date updateTime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public Byte getResignType() {
        return resignType;
    }

    public void setResignType(Byte resignType) {
        this.resignType = resignType;
    }

    public String getResignReason() {
        return resignReason;
    }

    public void setResignReason(String resignReason) {
        this.resignReason = resignReason;
    }

    public Date getExpectResignDate() {
        return expectResignDate;
    }

    public void setExpectResignDate(Date expectResignDate) {
        this.expectResignDate = expectResignDate;
    }

    public Integer getApproverId() {
        return approverId;
    }

    public void setApproverId(Integer approverId) {
        this.approverId = approverId;
    }

    public Date getApproveTime() {
        return approveTime;
    }

    public void setApproveTime(Date approveTime) {
        this.approveTime = approveTime;
    }

    public String getApproveRemark() {
        return approveRemark;
    }

    public void setApproveRemark(String approveRemark) {
        this.approveRemark = approveRemark;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Date getActualResignDate() {
        return actualResignDate;
    }

    public void setActualResignDate(Date actualResignDate) {
        this.actualResignDate = actualResignDate;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", empId=").append(empId);
        sb.append(", resignType=").append(resignType);
        sb.append(", resignReason=").append(resignReason);
        sb.append(", expectResignDate=").append(expectResignDate);
        sb.append(", approverId=").append(approverId);
        sb.append(", approveTime=").append(approveTime);
        sb.append(", approveRemark=").append(approveRemark);
        sb.append(", status=").append(status);
        sb.append(", actualResignDate=").append(actualResignDate);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}