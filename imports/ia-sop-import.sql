-- The Valley | LSPD Internal Affairs SOP import
-- Run the ENTIRE file in Supabase SQL Editor to publish these 12 sections.
-- Existing IA section numbers are preserved and will not be overwritten.
-- Final authority for disciplinary decisions, interim measures, and SOP amendments rests with LSPD High Command.

begin;

do $ia_import$
declare
  ia_department_id uuid;
begin
  select id into ia_department_id
  from public.departments
  where slug = 'ia'
  limit 1;

  if ia_department_id is null then
    raise exception 'Internal Affairs department not found. Expected public.departments.slug = ia.';
  end if;

  insert into public.sop_sections
    (department_id, section_number, title, content, sort_order, published)
  values
    (ia_department_id, '1', 'MISSION & SCOPE', $iabody1$
### 1.1 — Mission

Internal Affairs (IA) is responsible for reviewing credible allegations of officer misconduct, corruption, abuse of authority, and violations of departmental SOPs.

### 1.2 — Impartiality

IA must remain impartial and base all conclusions on documented facts rather than rank, personal relationships, or assumptions.

### 1.3 — Jurisdiction

IA may investigate LSPD personnel and incidents within the authority granted by department and server policies.

### 1.4 — Departmental Integrity

IA serves to maintain departmental integrity, accountability, and public trust.

### 1.5 — Applicability

All LSPD personnel are subject to Internal Affairs investigations when credible allegations are presented.
$iabody1$, 1, true),
    (ia_department_id, '2', 'RECEIVING COMPLAINTS', $iabody2$
### 2.1 — Complaint Information

Record the complainant's information, date and time, personnel involved, alleged conduct, incident location, and available supporting material.

### 2.2 — Acknowledgment

Acknowledge and document complaints according to established department procedures.

### 2.3 — No Promised Outcomes

Do not promise complainants a particular investigative outcome or disciplinary action.

### 2.4 — Supporting Material

Preserve submitted screenshots, recordings, MDT reports, bodycam footage, and witness information without altering original material.

### 2.5 — Equal Treatment

Complaints must be handled professionally regardless of the rank or position of the officer involved.
$iabody2$, 2, true),
    (ia_department_id, '3', 'CASE ASSIGNMENT & CONFLICTS OF INTEREST', $iabody3$
### 3.1 — Case Assignment

Every accepted complaint must receive an assigned case number and investigator.

### 3.2 — Supervisory Responsibility

IA supervisors are responsible for assigning investigations to appropriate personnel.

### 3.3 — Disclosure of Conflicts

Investigators must disclose any personal involvement, bias, or conflict of interest and request reassignment when necessary.

### 3.4 — Required Reassignment

Personnel must not investigate complaints involving close personal associates or matters in which they have a direct interest.

### 3.5 — Allegations Involving Senior Leadership

Allegations involving IA leadership, the Chief of Police, or other senior command personnel must be referred to an independent reviewer designated by LSPD High Command or to another government authority formally authorized by High Command.
$iabody3$, 3, true),
    (ia_department_id, '4', 'INVESTIGATIVE PROCEDURES', $iabody4$
### 4.1 — Identify the Allegation

Identify the allegation and the specific LSPD policy or SOP potentially violated.

### 4.2 — Evidence Review

Collect and review relevant reports, MDT records, authorized bodycam footage, evidence logs, and witness statements.

### 4.3 — Interviews

Interview involved officers, complainants, and witnesses fairly.

### 4.4 — Investigative Documentation

Document all investigative actions and responses accurately.

### 4.5 — Consider All Evidence

Consider both supporting and contradictory evidence before reaching a conclusion.

### 4.6 — Presumption During Review

Do not treat an allegation as proven before the investigation is completed.

### 4.7 — Compliance

All investigative methods must comply with server rules and applicable roleplay procedures.
$iabody4$, 4, true),
    (ia_department_id, '5', 'EVIDENCE & CONFIDENTIALITY', $iabody5$
### 5.1 — Evidence Log

Maintain an evidence log documenting what was received, who provided it, when it was received, and where it is stored.

### 5.2 — Evidence Preservation

Preserve original evidence whenever possible.

### 5.3 — Evidence Access and Transfers

Document any transfer, review, or authorized access to investigative material.

### 5.4 — Confidentiality

Limit case information to personnel with an authorized need to know.

### 5.5 — Unauthorized Disclosure

Do not disclose confidential investigative information to unauthorized officers or civilians.

### 5.6 — Non-Retaliation

Retaliation against complainants, witnesses, or individuals cooperating with IA is strictly prohibited.

### 5.7 — Proper Use of IA Resources

IA resources must never be used for personal disputes or personal benefit.
$iabody5$, 5, true),
    (ia_department_id, '6', 'INTERVIEWS & COOPERATION', $iabody6$
### 6.1 — Interview Records

Identify the purpose of each interview and document the date, participants, and relevant statements.

### 6.2 — Professional Treatment

Treat complainants, witnesses, and subjects professionally and consistently.

### 6.3 — Officer Cooperation

Officers involved in an investigation must follow applicable server regulations concerning cooperation and required notices.

### 6.4 — Accurate Statements

Document interview responses accurately and avoid misrepresenting statements.

### 6.5 — Refusal or Inability to Participate

Record refusals or inability to participate factually, without treating them alone as proof of misconduct.

### 6.6 — Representation and Recording

Any required representation or recording procedures must follow applicable server policies.
$iabody6$, 6, true),
    (ia_department_id, '7', 'MDT & CASE FILE REQUIREMENTS', $iabody7$
### 7.1 — Approved Case Template

All IA investigations must be documented using the approved Internal Affairs case template.

### 7.2 — Report Standards

Reports must use professional grammar, clear headings, and chronological formatting.

### 7.3 — Required Case File Information

Every case file should include:

- IA Case Number.
- Reporting Investigator.
- Complaint Information.
- Officer(s) Involved.
- Alleged Policy Violations.
- Incident Timeline.
- Evidence Inventory.
- Witness Statements.
- Investigative Actions.
- Findings and Recommendations.
- Supervisory Review.

### 7.4 — Distinguishing Information

Separate confirmed facts, disputed statements, and investigator analysis.

### 7.5 — Submission and Updates

Keep all case files updated and submit completed documentation through the designated IA reporting channel.
$iabody7$, 7, true),
    (ia_department_id, '8', 'FINDINGS & RECOMMENDATIONS', $iabody8$
### 8.1 — Findings

Each allegation must receive an appropriate finding based on the available evidence.

### 8.2 — Finding Categories

IA may use the following findings categories:

**Sustained:** Sufficient evidence supports that a policy violation occurred.

**Not Sustained:** Available evidence is insufficient to determine whether a violation occurred.

**Unfounded:** Evidence establishes that the alleged conduct did not occur or that the allegation is false.

**Exonerated:** The conduct occurred, but the officer's actions were within applicable policy.

### 8.3 — Explanation of Findings

Every finding must include an explanation supported by documented evidence.

### 8.4 — Recommendations

IA may recommend disciplinary action but must not exceed its assigned authority.

### 8.5 — Final Disciplinary Authority

IA findings and recommendations are submitted for review. **All final disciplinary decisions and approvals rest exclusively with LSPD High Command.** IA personnel and IA supervisors may not independently make a final disciplinary decision unless High Command has expressly delegated a specific decision in writing.

### 8.6 — Insufficient Evidence

If evidence is insufficient, investigators must clearly state that rather than speculate.
$iabody8$, 8, true),
    (ia_department_id, '9', 'ESCALATION & INTERIM MEASURES', $iabody9$
### 9.1 — Serious Allegations

Credible allegations involving serious corruption, evidence tampering, abuse of authority, or threats must be promptly referred to LSPD High Command or the appropriate authority designated by High Command.

### 9.2 — Command Notification

IA supervisors must notify LSPD High Command when an investigation involves serious departmental misconduct.

### 9.3 — Approval of Interim Measures

Temporary reassignment, suspension, or restriction of departmental access requires approval from LSPD High Command. IA may submit a recommendation but may not independently impose these measures.

### 9.4 — Independent Review

Personnel investigating a senior command member must maintain independence and follow the escalation process designated by LSPD High Command.

### 9.5 — Documentation

All approved interim measures must include the reason, approving authority, and duration.

### 9.6 — Limits of IA Authority

IA must not independently impose disciplinary measures or restrictions beyond its assigned authority.
$iabody9$, 9, true),
    (ia_department_id, '10', 'CASE CLOSURE & RECORD RETENTION', $iabody10$
### 10.1 — Closure Review

Before closing an investigation, confirm that required interviews, evidence reviews, findings, and approvals have been documented.

### 10.2 — Final Report Submission

Submit the completed investigative report to the designated reviewer.

### 10.3 — Final Decision Record

Record the final decision made by LSPD High Command and any disciplinary action authorized by High Command.

### 10.4 — Record Storage

Store all case records in the approved departmental location.

### 10.5 — Restricted Access

Access to closed IA cases must remain restricted to authorized personnel.

### 10.6 — Reopening Cases

Cases may be reopened when significant new evidence or information becomes available, subject to supervisory review and approval by LSPD High Command.
$iabody10$, 10, true),
    (ia_department_id, '11', 'PROHIBITED CONDUCT', $iabody11$
Internal Affairs personnel are strictly prohibited from:

- Fabricating, altering, concealing, or selectively misrepresenting evidence.
- Threatening, intimidating, retaliating against, or improperly pressuring participants.
- Investigating personal disputes without a legitimate departmental basis.
- Disclosing confidential investigative information without authorization.
- Abusing IA authority to target, harass, or intimidate LSPD personnel.
- Interfering with investigations due to personal relationships or rank.
- Claiming authority beyond their assigned position.
- Falsifying reports, findings, or investigative documentation.
- Using departmental resources for personal purposes.

### 11.1 — Consequences

Violations may result in removal from IA, disciplinary action, or further action authorized by LSPD High Command.
$iabody11$, 11, true),
    (ia_department_id, '12', 'REVIEW & COMPLIANCE', $iabody12$
### 12.1 — Personnel Compliance

All IA personnel are required to understand and follow these SOPs.

### 12.2 — Professional Standards

IA members must maintain professionalism, impartiality, confidentiality, and accountability.

### 12.3 — Failure to Comply

Failure to comply with these procedures may result in removal from an IA assignment or additional disciplinary action as determined by LSPD High Command.

### 12.4 — Policy Review

LSPD High Command is responsible for reviewing these SOPs when department policies or server regulations change.

### 12.5 — Amendments and Approval

All amendments must be reviewed and approved by LSPD High Command before they take effect. IA personnel may submit proposed revisions but may not independently change or authorize these SOPs.
$iabody12$, 12, true)
  on conflict (department_id, section_number) do nothing;
end;
$ia_import$;

commit;
