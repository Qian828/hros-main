package com.hros.model;

import java.io.Serializable;
import java.util.Date;

public class SysBlackList {
    /**
     * 主键ID
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     * 黑名单人员姓名
     *
     * @mbg.generated
     */
    private String name;

    /**
     * 身份证号（唯一标识）
     *
     * @mbg.generated
     */
    private String idcard;

    /**
     * 联系电话
     *
     * @mbg.generated
     */
    private String phone;

    /**
     * 加入黑名单原因（如：旷工、违规操作、盗窃等）
     *
     * @mbg.generated
     */
    private String reason;

    /**
     * 原所属部门/门店
     *
     * @mbg.generated
     */
    private String sourcedepartment;

    /**
     * 加入黑名单时间
     *
     * @mbg.generated
     */
    private Date addtime;

    /**
     * 黑名单到期时间（NULL表示永久）
     *
     * @mbg.generated
     */
    private Date expiretime;

    /**
     * 操作人（人事账号/姓名）
     *
     * @mbg.generated
     */
    private String operator;

    /**
     * 备注信息
     *
     * @mbg.generated
     */
    private String remark;

    /**
     * 状态：1-有效 0-失效
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getSourcedepartment() {
        return sourcedepartment;
    }

    public void setSourcedepartment(String sourcedepartment) {
        this.sourcedepartment = sourcedepartment;
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Date getExpiretime() {
        return expiretime;
    }

    public void setExpiretime(Date expiretime) {
        this.expiretime = expiretime;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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
        sb.append(", name=").append(name);
        sb.append(", idcard=").append(idcard);
        sb.append(", phone=").append(phone);
        sb.append(", reason=").append(reason);
        sb.append(", sourcedepartment=").append(sourcedepartment);
        sb.append(", addtime=").append(addtime);
        sb.append(", expiretime=").append(expiretime);
        sb.append(", operator=").append(operator);
        sb.append(", remark=").append(remark);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}