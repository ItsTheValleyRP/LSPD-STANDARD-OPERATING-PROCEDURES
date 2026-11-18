-- The Valley | K-9 Unit SOP import
-- Run the ENTIRE file in Supabase SQL Editor to publish these 10 sections.
-- Existing K-9 section numbers are preserved and will not be overwritten.

begin;

do $k9_import$
declare
  k9_department_id uuid;
begin
  select id into k9_department_id
  from public.departments
  where slug = 'k9'
  limit 1;

  if k9_department_id is null then
    raise exception 'K-9 department not found. Expected public.departments.slug = k9.';
  end if;

  insert into public.sop_sections
    (department_id, section_number, title, content, sort_order, published)
  values
    (k9_department_id, '1', 'K-9 UNIT FUNDAMENTALS', $k9body1$
### 1.1 — Mission Statement

The K-9 Unit is responsible for assisting law enforcement personnel through trained canine services, including narcotics detection, suspect searches, tracking, and general patrol support.

### 1.2 — Division Objectives

- Assist patrol officers during routine and specialized operations.
- Support narcotics and contraband investigations.
- Assist with locating missing persons and wanted suspects.
- Provide additional support during high-risk incidents when authorized.
- Maintain proper canine care, training, and discipline.

### 1.3 — Professional Standards

All handlers must:

- Remain professional and respectful.
- Follow department and K-9 Unit SOPs.
- Maintain control of their assigned canine.
- Avoid unnecessary or unauthorized deployments.
- Prioritize public safety and canine welfare.

### 1.4 — Chain of Command

All K-9 personnel must follow their assigned departmental chain of command.

K-9 supervisors are responsible for overseeing handlers, training, and unit operations.
$k9body1$, 1, true),
    (k9_department_id, '2', 'HANDLER RESPONSIBILITIES', $k9body2$
### 2.1 — Handler Qualifications

All K-9 handlers must be approved by department command and successfully complete the required K-9 training.

### 2.2 — Handler Accountability

Handlers are responsible for:

- Their assigned canine.
- Canine equipment.
- Deployment decisions.
- Training participation.
- Proper documentation.
- Reporting incidents involving their canine.

### 2.3 — Canine Control

Handlers must maintain appropriate control of their canine during all deployments.

A canine must not be left unattended in situations where its safety or the public's safety could be compromised.

### 2.4 — Handler Availability

Handlers should remain available to assist patrol and other authorized divisions when possible.

### 2.5 — Equipment Responsibility

Handlers must ensure their assigned equipment is available, functional, and properly maintained.
$k9body2$, 2, true),
    (k9_department_id, '3', 'CANINE CARE & WELFARE', $k9body3$
### 3.1 — General Care

Handlers are responsible for maintaining their canine's general health and welfare.

### 3.2 — Health Monitoring

Handlers should monitor their canine for signs of fatigue, injury, illness, or distress.

### 3.3 — Rest Periods

Canines must receive appropriate rest periods between deployments and training sessions.

### 3.4 — Transportation

Canines must be transported using approved departmental procedures and appropriate equipment.

### 3.5 — Injury Reporting

Any injury or health concern involving an assigned canine must be reported to K-9 supervision.

### 3.6 — Retirement & Reassignment

Canines may be reassigned or retired when they are no longer suitable for active service.
$k9body3$, 3, true),
    (k9_department_id, '4', 'K-9 DEPLOYMENT PROCEDURES', $k9body4$
### 4.1 — Deployment Authorization

K-9 deployments must be conducted within the handler's training, assigned responsibilities, and applicable department policies.

### 4.2 — Patrol Assistance

K-9 handlers may assist patrol officers during:

- Traffic stops.
- Narcotics-related incidents.
- Suspect searches.
- Missing person incidents.
- Search operations.
- Other approved law enforcement activities.

### 4.3 — Deployment Requests

Officers requesting K-9 assistance should provide:

- Current location.
- Reason for requesting assistance.
- Relevant incident information.
- Any known safety concerns.

### 4.4 — Scene Coordination

Handlers must coordinate with officers already present before beginning a deployment.

### 4.5 — Deployment Documentation

Significant deployments must be documented through the appropriate departmental reporting system.
$k9body4$, 4, true),
    (k9_department_id, '5', 'NARCOTICS & CONTRABAND DETECTION', $k9body5$
### 5.1 — Detection Responsibilities

Trained narcotics-detection canines may assist in identifying the possible presence of prohibited substances or contraband.

### 5.2 — Authorized Searches

K-9 detection activities must comply with server laws, search regulations, and applicable warrant requirements.

### 5.3 — Detection Alerts

Any canine alert must be documented accurately by the handler.

An alert should be treated as an investigative lead and handled according to applicable server procedures.

### 5.4 — Evidence Recovery

Any recovered contraband must be handled by authorized personnel and documented appropriately.

### 5.5 — False or Inconclusive Alerts

Handlers must report inconclusive results honestly.

A handler must never fabricate or exaggerate a canine alert to justify an investigation or search.
$k9body5$, 5, true),
    (k9_department_id, '6', 'SUSPECT SEARCHES & TRACKING', $k9body6$
### 6.1 — Suspect Searches

K-9 personnel may assist in locating suspects when requested by authorized law enforcement personnel.

### 6.2 — Missing Persons

K-9 teams may assist with searches involving missing or endangered individuals.

### 6.3 — Tracking Operations

Tracking activities must be conducted within the canine's training and approved server procedures.

### 6.4 — Suspect Detention

Any apprehension or detention involving a canine must comply with department policy and applicable roleplay regulations.

### 6.5 — Medical Attention

If an individual or canine is injured during an incident, appropriate medical assistance must be requested.

### 6.6 — Reporting

Handlers must document significant tracking and search operations, including their outcomes.
$k9body6$, 6, true),
    (k9_department_id, '7', 'HIGH-RISK OPERATIONS & SPECIALIZED SUPPORT', $k9body7$
### 7.1 — High-Risk Deployments

K-9 personnel may assist during high-risk incidents when authorized and appropriate for the situation.

### 7.2 — SWAT Coordination

K-9 handlers may coordinate with SWAT during approved operations.

The SWAT supervisor and K-9 handler must establish their respective responsibilities before deployment.

### 7.3 — Multi-Division Operations

K-9 may assist CID, patrol, BCSO, SASP, and other authorized divisions.

### 7.4 — Operational Restrictions

Handlers must not deploy their canine outside its training or assigned capabilities.

### 7.5 — Supervisor Authorization

Specialized operations may require approval from the appropriate supervisor or command personnel.
$k9body7$, 7, true),
    (k9_department_id, '8', 'EQUIPMENT & VEHICLE REGULATIONS', $k9body8$
### 8.1 — Approved Equipment

K-9 personnel must use approved departmental equipment.

### 8.2 — K-9 Vehicles

Assigned K-9 vehicles must be maintained and used for authorized departmental activities.

### 8.3 — Equipment Maintenance

Handlers are responsible for reporting damaged, missing, or malfunctioning equipment.

### 8.4 — Unauthorized Equipment

Personnel must not use unapproved equipment or modifications during official deployments.

### 8.5 — Vehicle & Canine Security

Handlers must ensure their canine is safely secured when not actively deployed.
$k9body8$, 8, true),
    (k9_department_id, '9', 'TRAINING & CERTIFICATION', $k9body9$
### 9.1 — Initial Training

All prospective handlers must complete approved K-9 training before receiving operational authorization.

### 9.2 — Training Requirements

Training should cover:

- Handler responsibilities.
- Canine control.
- Narcotics detection roleplay.
- Search and tracking scenarios.
- Public safety.
- Deployment procedures.
- Reporting requirements.

### 9.3 — Practical Evaluations

Handlers must demonstrate their ability to work with their assigned canine in simulated scenarios.

### 9.4 — Certification

Only personnel who have successfully completed the required evaluation may operate as certified K-9 handlers.

### 9.5 — Continuing Training

Handlers should participate in periodic training to maintain familiarity with department procedures.

### 9.6 — Certification Suspension

K-9 authorization may be suspended if a handler fails to meet department requirements or violates unit SOPs.
$k9body9$, 9, true),
    (k9_department_id, '10', 'REPORTING, ACCOUNTABILITY & DISCIPLINARY PROCEDURES', $k9body10$
### 10.1 — Deployment Reports

Handlers must document significant K-9 deployments.

Reports should include:

- Handler identification.
- Canine identification.
- Incident location.
- Date and time.
- Reason for deployment.
- Deployment outcome.
- Evidence or findings.
- Any injuries or unusual circumstances.

### 10.2 — Incident Reports

Any incident involving improper canine conduct, injury, or a complaint must be reported to K-9 supervision.

### 10.3 — Supervisory Reviews

K-9 supervisors may review deployment reports, training records, and handler performance.

### 10.4 — Violations

The following may result in disciplinary action:

- Unauthorized canine deployment.
- Failure to maintain canine control.
- Misrepresentation of detection alerts.
- Neglect of canine welfare.
- Misuse of departmental equipment.
- Falsification of deployment reports.
- Failure to follow the chain of command.

### 10.5 — Disciplinary Actions

Depending on severity, disciplinary action may include:

- Verbal warning.
- Written warning.
- Mandatory retraining.
- Temporary suspension.
- Removal from the K-9 Unit.
- Departmental termination.

### 10.6 — Final Authority

K-9 Command reserves the right to interpret and enforce these SOPs, subject to department policy and server-wide regulations.

---

**END OF DOCUMENT**

**THE VALLEY | K-9 UNIT**

*Discipline. Loyalty. Service. Protection.*
$k9body10$, 10, true)
  on conflict (department_id, section_number) do nothing;
end;
$k9_import$;

commit;
