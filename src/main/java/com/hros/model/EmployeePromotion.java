package com.hros.model;

import java.io.Serializable;
import java.util.Date;

public class EmployeePromotion implements Serializable {
    private Integer id;

    /**
     * 员工ID
     *
     * @mbg.generated
     */
    private Integer empId;

    /**
     * 原职位ID
     *
     * @mbg.generated
     */
    private Integer oldPosId;

    /**
     * 晋升职位ID
     *
     * @mbg.generated
     */
    private Integer newPosId;

    /**
     * 原职称ID
     *
     * @mbg.generated
     */
    private Integer oldJobLevelId;

    /**
     * 晋升职称ID
     *
     * @mbg.generated
     */
    private Integer newJobLevelId;

    /**
     * 晋升理由
     *
     * @mbg.generated
     */
    private String reason;

    /**
     * 申请时间
     *
     * @mbg.generated
     */
    private Date applyTime;

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
    private Date approveTime;

    /**
     * 审批意见
     *
     * @mbg.generated
     */
    private String approveRemark;

    /**
     * 0待审批 1已通过 2已拒绝
     *
     * @mbg.generated
     */
    private Byte status;

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

    public Integer getOldPosId() {
        return oldPosId;
    }

    public void setOldPosId(Integer oldPosId) {
        this.oldPosId = oldPosId;
    }

    public Integer getNewPosId() {
        return newPosId;
    }

    public void setNewPosId(Integer newPosId) {
        this.newPosId = newPosId;
    }

    public Integer getOldJobLevelId() {
        return oldJobLevelId;
    }

    public void setOldJobLevelId(Integer oldJobLevelId) {
        this.oldJobLevelId = oldJobLevelId;
    }

    public Integer getNewJobLevelId() {
        return newJobLevelId;
    }

    public void setNewJobLevelId(Integer newJobLevelId) {
        this.newJobLevelId = newJobLevelId;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getApplyTime() {
        return applyTime;
    }

    public void setApplyTime(Date applyTime) {
        this.applyTime = applyTime;
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", empId=").append(empId);
        sb.append(", oldPosId=").append(oldPosId);
        sb.append(", newPosId=").append(newPosId);
        sb.append(", oldJobLevelId=").append(oldJobLevelId);
        sb.append(", newJobLevelId=").append(newJobLevelId);
        sb.append(", reason=").append(reason);
        sb.append(", applyTime=").append(applyTime);
        sb.append(", approverId=").append(approverId);
        sb.append(", approveTime=").append(approveTime);
        sb.append(", approveRemark=").append(approveRemark);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}