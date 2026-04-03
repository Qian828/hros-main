package com.hros.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class CooperationAgency implements Serializable {
    /**
     * 主键ID
     *
     * @mbg.generated
     */
    private Integer id;

    /**
     * 机构全称
     *
     * @mbg.generated
     */
    private String agencyName;

    /**
     * 机构类型：学校/劳务公司/中介
     *
     * @mbg.generated
     */
    private String agencyType;

    /**
     * 对接人
     *
     * @mbg.generated
     */
    private String contactPerson;

    /**
     * 联系电话
     *
     * @mbg.generated
     */
    private String contactPhone;

    /**
     * 供应类型：实习生/兼职/寒暑假工
     *
     * @mbg.generated
     */
    private String supplyType;

    /**
     * 适配岗位，多选用逗号分隔：服务员,后厨,传菜,收银,保洁
     *
     * @mbg.generated
     */
    private String internPost;

    /**
     * 开户名
     *
     * @mbg.generated
     */
    private String bankAccountName;

    /**
     * 开户银行
     *
     * @mbg.generated
     */
    private String bankName;

    /**
     * 银行账号
     *
     * @mbg.generated
     */
    private String bankAccount;

    /**
     * 计费方式：按人/月、按天、一次性
     *
     * @mbg.generated
     */
    private String serviceFeeMode;

    /**
     * 管理费金额
     *
     * @mbg.generated
     */
    private BigDecimal serviceFeeAmount;

    /**
     * 结算周期：月结/周结/半月结
     *
     * @mbg.generated
     */
    private String settleCycle;

    /**
     * 发票类型：专票/普票/无票
     *
     * @mbg.generated
     */
    private String taxType;

    /**
     * 机构地址
     *
     * @mbg.generated
     */
    private String agencyAddress;

    /**
     * 备注
     *
     * @mbg.generated
     */
    private String remark;

    /**
     * 创建时间
     *
     * @mbg.generated
     */
    private Date createTime;

    /**
     * 更新时间
     *
     * @mbg.generated
     */
    private Date updateTime;

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAgencyName() {
        return agencyName;
    }

    public void setAgencyName(String agencyName) {
        this.agencyName = agencyName;
    }

    public String getAgencyType() {
        return agencyType;
    }

    public void setAgencyType(String agencyType) {
        this.agencyType = agencyType;
    }

    public String getContactPerson() {
        return contactPerson;
    }

    public void setContactPerson(String contactPerson) {
        this.contactPerson = contactPerson;
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone;
    }

    public String getSupplyType() {
        return supplyType;
    }

    public void setSupplyType(String supplyType) {
        this.supplyType = supplyType;
    }

    public String getInternPost() {
        return internPost;
    }

    public void setInternPost(String internPost) {
        this.internPost = internPost;
    }

    public String getBankAccountName() {
        return bankAccountName;
    }

    public void setBankAccountName(String bankAccountName) {
        this.bankAccountName = bankAccountName;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBankAccount() {
        return bankAccount;
    }

    public void setBankAccount(String bankAccount) {
        this.bankAccount = bankAccount;
    }

    public String getServiceFeeMode() {
        return serviceFeeMode;
    }

    public void setServiceFeeMode(String serviceFeeMode) {
        this.serviceFeeMode = serviceFeeMode;
    }

    public BigDecimal getServiceFeeAmount() {
        return serviceFeeAmount;
    }

    public void setServiceFeeAmount(BigDecimal serviceFeeAmount) {
        this.serviceFeeAmount = serviceFeeAmount;
    }

    public String getSettleCycle() {
        return settleCycle;
    }

    public void setSettleCycle(String settleCycle) {
        this.settleCycle = settleCycle;
    }

    public String getTaxType() {
        return taxType;
    }

    public void setTaxType(String taxType) {
        this.taxType = taxType;
    }

    public String getAgencyAddress() {
        return agencyAddress;
    }

    public void setAgencyAddress(String agencyAddress) {
        this.agencyAddress = agencyAddress;
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
        sb.append(", agencyName=").append(agencyName);
        sb.append(", agencyType=").append(agencyType);
        sb.append(", contactPerson=").append(contactPerson);
        sb.append(", contactPhone=").append(contactPhone);
        sb.append(", supplyType=").append(supplyType);
        sb.append(", internPost=").append(internPost);
        sb.append(", bankAccountName=").append(bankAccountName);
        sb.append(", bankName=").append(bankName);
        sb.append(", bankAccount=").append(bankAccount);
        sb.append(", serviceFeeMode=").append(serviceFeeMode);
        sb.append(", serviceFeeAmount=").append(serviceFeeAmount);
        sb.append(", settleCycle=").append(settleCycle);
        sb.append(", taxType=").append(taxType);
        sb.append(", agencyAddress=").append(agencyAddress);
        sb.append(", remark=").append(remark);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}