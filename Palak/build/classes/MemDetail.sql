create table Memdetail
(
	memdate varchar2(12),
	memcode varchar2(10),
	Memname varchar2(15),
	Memfname varchar2(15),
	Mothername varchar2(15),
	Gender varchar2(15),
	MarritalStatus varchar2(15),
	MemAddr varchar2(15),
	MemCity varchar2(15),
	MemState varchar2(15),
	MemCountry varchar2(15),
	MemPinno number(6),
	MemAge number(2),
	MemTelno number(10),
	MemMobno number(10),
	MemEmailid varchar2(30),
	MemPanno varchar2(12),
	MemResiProof varchar2(15),
	MemIdProof varchar2(15),
	Memnomname varchar2(15),
	Memnomfname varchar2(15),
	Memnomage number(2),
	Memnomrelation varchar2(15)
)
/
create table Account
(
	Rddate varchar2(12),
	MemCode varchar2(15),
	Mmname varchar2(30),
	PlanType varchar2(15),
	PlanCategory varchar2(15),
	PlanDuration varchar2(15),
	ConsidAmt number number(10),
	InstallmentMode varchar2(20),
	installmentAmt number(10),
	MatAmt number(10),
	AgentCode varchar2(15),
	AgentName varchar2(30),
	RdNo varchar2(15)
)
/
create table AgentCommissionMaster
(
	plantype varchar2(20), 
	nrm_spcl varchar2(15),
	Duration varchar2(15),
	com_year_from varchar2(15),
	com_year_to varchar2(15),
	Sno1 number(15),
	Rank1 varchar2(20),
	Commission1 varchar2(15),
	Sno2 number(15),
	Rank2 varchar2(20),
	Commission2 varchar2(15),
	Sno3 number(15),
	Rank3 varchar2(20),
	Commission3 varchar2(15),
	Sno4 number(15),
	Rank4 varchar2(20),
	Commission4 varchar2(15),
	Sno5 number(15),
	Rank5 varchar2(20),
	Commission5 varchar2(15)
)
/
create table fdaccount
(
	MemCode varchar2(15),
	Mmname varchar2(30),
	PlanType varchar2(20),
	PlanCategory varchar2(20),
	PlanDuration varchar2(20),
	ConsidAmt number(15),
	MatAmt number(20),
	AgentCode varchar2(15),
	AgentName varchar2(30),
	FdNo varchar2(15)
)
/
create table AgentMaster
(
	MemCode varchar2(15),
	MemName varchar2(30),
	AgentCode varchar2(15),
	Rank varchar2(15),
	Regndate varchar2(15),
	IntroCode varchar2(15),
	IntroName varchar2(30),
	IntroRank varchar2(15),
	Agencyfee number(15)
)
/
create table plan 
(
	PlanType varchar2(15),
	PlanCategory varchar2(15),
	PlanDuration varchar2(15),
	ConsidAmt number(10),
	MonthAmt number(10),
	QtrlyAmt number(10),
	HyrlyAmt number(10),
	YrlyAmt number(10),
	MatAmt number(10),
	QuotaPercent number(10),
	InterestPercent number(10)
)
/
create table RegnForm
(
	usernm varchar2(30),
	dob varchar2(12),
	mobno number(11),
	pass varchar2(20),
	pass1 varchar2(20)
)
/
create table key_Details
(
	memcode number(8),
	rdcode number(8),
	fdcode number(8),
	Agentcode number(8)
);