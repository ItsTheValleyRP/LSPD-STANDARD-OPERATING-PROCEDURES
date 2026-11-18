-- The Valley | Criminal Investigations Division (CID) SOP import
-- Run the ENTIRE file in Supabase SQL Editor to publish these 10 sections.
-- Existing CID section numbers are preserved and will not be overwritten.

begin;

do $cid_import$
declare
  cid_department_id uuid;
begin
  select id into cid_department_id
  from public.departments
  where slug = 'cid'
  limit 1;

  if cid_department_id is null then
    raise exception 'CID department not found. Expected public.departments.slug = cid.';
  end if;

  insert into public.sop_sections
    (department_id, section_number, title, content, sort_order, published)
  values
    (cid_department_id, '1', 'CID FUNDAMENTALS', $cidbody1$
### 1.1 — Mission Statement

The Criminal Investigations Division (CID) is responsible for investigating serious criminal activity, gathering intelligence, identifying suspects, and developing evidence-supported cases.

### 1.2 — Division Objectives

- Investigate major criminal offenses and organized criminal activity.
- Identify individuals involved in criminal operations.
- Collect, preserve, and document evidence.
- Develop comprehensive investigative case files.
- Assist patrol and other law enforcement divisions when requested.
- Ensure investigations are conducted professionally and impartially.

### 1.3 — Professional Standards

All CID personnel must:

- Maintain professionalism during investigations.
- Remain unbiased and avoid personal conflicts.
- Protect confidential investigative information.
- Follow department SOPs and server regulations.
- Maintain accurate and truthful documentation.

### 1.4 — Chain of Command

All personnel must follow their assigned chain of command.

Major investigative developments, operational concerns, and disciplinary matters must be reported to the appropriate supervisor.

### 1.5 — CID Jurisdiction

CID may investigate cases involving serious criminal offenses, repeat offenders, organized criminal activity, and other matters assigned by command.
$cidbody1$, 1, true),
    (cid_department_id, '2', 'INVESTIGATIVE PROCEDURES', $cidbody2$
### 2.1 — Opening an Investigation

Every investigation must begin with a documented reason for opening a case.

The initial case record should include:

- Incident description.
- Date and approximate time.
- Known individuals involved.
- Initial allegations.
- Available evidence.
- Assigned investigator.

### 2.2 — Developing Investigative Leads

Investigators may develop leads through:

- Witness interviews.
- Suspect interviews.
- Review of MDT records.
- Evidence examination.
- Approved intelligence reports.
- Information received from other departments.

All information must be documented and appropriately verified.

### 2.3 — Case Assignment

Investigations may be assigned by CID command or an authorized supervisor.

Investigators must provide updates when significant developments occur.

### 2.4 — Case Progression

Investigators must maintain an organized case file throughout the investigation.

New evidence, witness statements, and investigative developments must be added to the appropriate records.

### 2.5 — Closing an Investigation

A case may be closed when:

- The investigation has reached a reasonable conclusion.
- Available evidence has been documented.
- Required reports have been completed.
- A supervisor has reviewed the case.

Cases may also remain open when additional investigative work is necessary.
$cidbody2$, 2, true),
    (cid_department_id, '3', 'CRIME SCENE MANAGEMENT', $cidbody3$
### 3.1 — Scene Security

CID personnel must coordinate with responding officers to ensure crime scenes are appropriately secured.

Unauthorized individuals should not be permitted to interfere with evidence collection.

### 3.2 — Scene Documentation

Investigators should document:

- Scene location.
- Date and time.
- Individuals present.
- Relevant observations.
- Photographic evidence.
- Items collected or identified.

### 3.3 — Evidence Preservation

Investigators must avoid unnecessarily disturbing potential evidence.

All recovered items must be documented and handled according to department procedures.

### 3.4 — Scene Processing

CID may assist with scene processing when requested or when the investigation requires additional examination.

### 3.5 — Returning to a Scene

Investigators may revisit a scene when additional information, clarification, or authorized evidence collection is required.
$cidbody3$, 3, true),
    (cid_department_id, '4', 'EVIDENCE & FORENSICS', $cidbody4$
### 4.1 — Definition of Evidence

Evidence consists of information or material that supports or contradicts an allegation or investigative theory.

### 4.2 — Evidence Categories

CID may encounter:

- Physical evidence.
- Digital evidence.
- Photographic evidence.
- Witness statements.
- Forensic results.
- Official department records.

### 4.3 — Evidence Collection

All evidence must be collected in accordance with server regulations and department procedures.

Items must be properly identified, documented, and secured.

### 4.4 — Chain of Custody

A chain of custody must document:

- Who recovered the evidence.
- When it was recovered.
- Who handled or transferred it.
- Where it was stored.
- Any authorized examination performed.

### 4.5 — Forensic Examination

Evidence requiring additional examination may be submitted to an authorized forensic resource.

Results must be documented and attached to the appropriate case file.

### 4.6 — Evidence Integrity

Personnel must never fabricate, alter, conceal, or intentionally misrepresent evidence.
$cidbody4$, 4, true),
    (cid_department_id, '5', 'MDT & CASE FILE MANAGEMENT', $cidbody5$
### 5.1 — Purpose of the MDT

The Mobile Data Terminal (MDT) serves as the official recordkeeping system for CID investigations and departmental documentation.

### 5.2 — Report Requirements

All investigative reports should contain:

- Case identification number.
- Reporting investigator.
- Date and time.
- Incident location.
- Involved individuals.
- Summary of allegations.
- Evidence collected.
- Witness statements.
- Investigative findings.

### 5.3 — Case File Formatting

All case files must be:

- Professionally written.
- Organized using appropriate headings.
- Chronological whenever possible.
- Grammatically understandable.
- Supported by documented information.

### 5.4 — Evidence Attachments

Relevant photographs, recordings, statements, and forensic results should be attached or referenced in the appropriate case file.

### 5.5 — Report Corrections

Supervisors may return incomplete or improperly formatted reports for correction.

Investigators must make requested corrections before final submission.
$cidbody5$, 5, true),
    (cid_department_id, '6', 'WARRANT PROCEDURES & AUTHORIZATION', $cidbody6$
### 6.1 — General Warrant Policy

A warrant is an authorization issued by an approved authority permitting a specific investigative or enforcement action under server regulations.

CID personnel must not independently authorize their own warrants.

### 6.2 — Recognized Warrant Categories

Depending on server policy, CID may request:

- Search Warrants.
- Arrest Warrants.
- Property Seizure Warrants.
- Other warrant categories approved by government policy.

### 6.3 — Warrant Application Requirements

Every warrant application should include:

- Requesting investigator.
- Suspect information.
- Requested warrant type.
- Alleged offenses.
- Incident summary.
- Probable cause statement.
- Supporting evidence.
- Requested authorization.
- Date of submission.

### 6.4 — Warrant Review Authority

Since The Valley currently does not operate a Department of Justice, warrant requests will be submitted to a designated **Warrant Review Authority (WRA)**.

The WRA will be responsible for reviewing applications and determining whether the request meets server requirements.

Authorized reviewers may include:

- Appointed Judicial Officials.
- Designated Government Officials.
- An independently appointed Warrant Review Officer.

CID Command may recommend appointments but should not automatically possess authority to approve its own investigators' warrants.

### 6.5 — Warrant Approval Process

The following process must be followed:

1. Investigator completes the warrant application.
2. Supporting evidence is attached.
3. Application is submitted through the designated warrant submission channel.
4. Authorized reviewer examines the request.
5. Reviewer approves, denies, or requests additional information.
6. Final decision is documented in the warrant record.

### 6.6 — Warrant Denials

Denied applications must include a reason for denial whenever possible.

Investigators may correct deficiencies and submit a revised application.

### 6.7 — Conflicts of Interest

An individual must not review a warrant request involving themselves or an investigation in which they have a direct personal interest.

### 6.8 — Emergency Situations

Emergency actions must follow applicable server rules. The absence of a reviewer does not automatically grant CID authority to bypass required authorization.
$cidbody6$, 6, true),
    (cid_department_id, '7', 'INTERVIEWS, INTERROGATIONS & INTELLIGENCE', $cidbody7$
### 7.1 — Witness Interviews

Witness interviews are conducted to obtain relevant information about an incident or investigation.

Investigators should document statements accurately and distinguish firsthand knowledge from speculation.

### 7.2 — Suspect Interrogations

Suspect questioning must remain professional and comply with applicable server regulations and roleplay procedures.

### 7.3 — Confidential Informants

Information received from confidential informants must be documented appropriately.

Investigators should consider the source's credibility and seek independent corroboration.

### 7.4 — Intelligence Verification

Intelligence must not automatically be treated as confirmed evidence.

Investigators must distinguish between:

- Verified information.
- Unverified allegations.
- Witness accounts.
- Investigative conclusions.

### 7.5 — Cooperation Agreements

Any immunity arrangements, reduced charges, or other agreements must receive the authorization required by server policy.

Investigators cannot independently promise legal outcomes outside their authority.
$cidbody7$, 7, true),
    (cid_department_id, '8', 'SURVEILLANCE & SPECIAL OPERATIONS', $cidbody8$
### 8.1 — Surveillance

CID may conduct authorized surveillance to gather information relevant to an active investigation.

All surveillance must comply with server rules and applicable authorization requirements.

### 8.2 — Undercover Operations

Undercover activities must be approved by the appropriate CID supervisor.

Personnel must maintain operational professionalism and document relevant findings.

### 8.3 — Controlled Operations

Stings and other controlled operations require supervisory authorization before execution.

### 8.4 — Operational Planning

Before an operation, personnel should establish:

- Operational objective.
- Assigned personnel.
- Supervisory oversight.
- Communication arrangements.
- Relevant authorizations.
- Reporting responsibilities.

### 8.5 — Team Operations

Complex operations should involve appropriate personnel and coordination with relevant divisions.

### 8.6 — Operational Security

Investigative information must only be shared with personnel who have an authorized need to know.
$cidbody8$, 8, true),
    (cid_department_id, '9', 'INTERDEPARTMENTAL COOPERATION & COMMAND', $cidbody9$
### 9.1 — Cooperation With Patrol

CID may assist patrol officers with ongoing investigations, suspect identification, evidence review, and case development.

### 9.2 — Cooperation With Other Divisions

CID may coordinate with:

- SWAT.
- K-9.
- Air One.
- BCSO.
- SASP.
- Other authorized law enforcement divisions.

### 9.3 — Joint Investigations

Joint investigations must have clearly established responsibilities and appropriate supervisory coordination.

### 9.4 — Command Notifications

CID supervisors must be informed of:

- Significant investigative developments.
- Major arrests.
- High-profile investigations.
- Major evidence discoveries.
- Operational complications.

### 9.5 — Information Sharing

Case information may be shared with other departments when necessary for legitimate law enforcement purposes and permitted by department policy.

### 9.6 — Departmental Accountability

All CID members remain subject to department policies, supervisory review, and disciplinary procedures.
$cidbody9$, 9, true),
    (cid_department_id, '10', 'TRAINING, EVALUATION & DISCIPLINARY STANDARDS', $cidbody10$
### 10.1 — Initial CID Training

New CID personnel must demonstrate an understanding of:

- CID fundamentals.
- Investigative procedures.
- Crime scene management.
- Evidence handling.
- MDT documentation.
- Warrant procedures.
- Interview procedures.
- Operational professionalism.

### 10.2 — Practical Evaluation

Trainees must complete a mock investigation demonstrating their ability to:

- Open and develop an investigative case.
- Document relevant evidence.
- Prepare a professional MDT report.
- Establish a documented chain of custody.
- Prepare a warrant application.
- Submit a complete case file for supervisory review.

### 10.3 — Training Approval

Successful completion of training must be reviewed by an authorized CID supervisor or training officer.

### 10.4 — Continuing Education

CID personnel may be required to complete additional training when procedures, department policies, or server regulations change.

### 10.5 — Violations

The following may result in disciplinary action:

- Evidence fabrication or tampering.
- Unauthorized disclosure of confidential information.
- Improper warrant authorization.
- Falsification of investigative reports.
- Abuse of investigative authority.
- Failure to follow the chain of command.
- Unprofessional conduct.

### 10.6 — Disciplinary Authority

Disciplinary matters will be reviewed by CID Command or the appropriate departmental authority.

Depending on severity, consequences may include:

- Verbal warning.
- Written warning.
- Retraining.
- Suspension.
- Removal from CID.
- Departmental termination.

### 10.7 — Final Authority

CID Command reserves the right to interpret and enforce these SOPs, subject to government policy and server-wide regulations.

---

**END OF DOCUMENT**

**THE VALLEY | CRIMINAL INVESTIGATIONS DIVISION**

*Integrity. Accountability. Investigation. Justice.*
$cidbody10$, 10, true)
  on conflict (department_id, section_number) do nothing;
end;
$cid_import$;

commit;
