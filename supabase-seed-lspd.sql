-- Import the current LSPD master SOP into Supabase.
-- Run after supabase-schema.sql. This preserves the supplied section text.
insert into public.sop_sections(department_id, section_number, title, content, sort_order, published)
select d.id, v.section_number, v.title, v.content, v.sort_order, true
from public.departments d
cross join (values
  ('1','GENERAL DEPARTMENT POLICIES','### 1.1 Chain of Command
- All officers must respect the department''s chain of command.
- Officers must follow reasonable instructions from higher-ranking personnel.
- Questions and concerns should be directed to the immediate supervisor first.
- If a supervisor is unavailable, officers should escalate through the chain of command.
- Disrespect, insubordination, or knowingly disregarding department instructions may result in discipline.

### 1.2 Activity Requirements
- Officers must complete a minimum of **5 hours of activity per week**.
- Each week of unapproved inactivity may result in one strike.
- Leave of Absence (LOA) requests must be submitted through PD Emails.
- LOAs may last up to one month before renewal is required.

### 1.3 Off-Duty Regulations
- Officers must be fully clocked out in-city and through department emails.
- Department equipment must be stored when off duty.
- Officers may not use police uniforms or department vehicles while off duty.
- Off-duty officers must not independently intervene in active crimes.
- Officers should contact law enforcement and cooperate with responding personnel.

### 1.4 Identification
- Officers must carry their badge while on duty.
- When reasonably requested, officers must provide their name, callsign, and identification.
- Misrepresenting department identity is prohibited.

---',1),
  ('2','RANK STRUCTURE AND AUTHORITY','### 2.1 Executive Leadership

The following positions make up the highest leadership of the LSPD:

| Position | Callsign | Authority |
|---|---|---|
| Xeno | **X-001** | Highest department authority |
| Xeno | **X-002** | Highest department authority |
| Commissioner | **W-001** | Oversees the entire LSPD |
| Assistant Commissioner | **W-002** | Assists the Commissioner |
| Deputy Commissioner | **W-003** | Supports executive leadership |

- X-001 and X-002 hold the highest authority in the department.
- Both Xeno positions rank above all Commissioner positions.
- The Commissioner oversees department operations and leadership.
- The Assistant Commissioner supports the Commissioner and helps oversee department-wide operations.
- The Deputy Commissioner assists with administration and department oversight.

### 2.2 Remaining Callsign Structure

| Rank / Position | Callsign Range |
|---|---|
| High Command | L-001–L-014 |
| Command | L-101–L-299 |
| Supervisor | L-301–L-599 |
| Senior Officer | L-601–L-699 |
| Officer | L-701–L-799 |
| Probationary Officer | L-801–L-899 |
| Cadet | L-901–L-999 |

### 2.3 Rank Permissions
- **High Command:** Handles department oversight, major decisions, and legal matters.
- **Command:** Supervises department operations and may use authorized unmarked vehicles.
- **Supervisor:** Oversees patrol personnel and may use authorized slicktop vehicles.
- **Senior Officer:** Eligible for FTO responsibilities and Class 2 certification.
- **Officer:** Performs general patrol and department duties.
- **Probationary Officer:** May patrol independently and respond to permitted non-gang-turf calls.
- **Cadet:** Must ride with an FTO when one is available.

### 2.4 Additional Requirements
- Senior Officers must hold their rank for at least one week before promotion to Supervisor.
- Cadets must complete firearm training to receive Class 1 certification.
- Cadets may not patrol alone unless they are the only officers available or High Command approves it.

---',2),
  ('3','EQUIPMENT, WEAPONS AND BODYCAM','### 3.1 Required Equipment
Officers must carry the equipment necessary for their assigned duties, including:
- Active bodycam and radio.
- Taser and handcuffs.
- IFaks and armor.
- Flashlight and evidence camera.
- Mobile fingerprint scanner.
- Evidence pouch and DNA swab kits.
- Access tool and other approved department equipment.

### 3.2 Weapon Permissions

| Weapon | Minimum Rank | Certification |
|---|---|---|
| White/Pink Taser | Cadet+ | None |
| PD 57 | Cadet+ | None |
| Switches | Officer+ | None |
| PD Glock | Cadet+ | Class 1 |
| PD SMG | Senior Officer+ | Class 2 |
| PD M4 | Sergeant+ | Class 3 |
| Non-Lethal Shotgun | Lieutenant+ | Class 4 |
| MP7F | QRT/SWAT | Class 2 |
| SWAT LBRS | QRT/SWAT | Class 3 |
| Lethal Shotgun | QRT/SWAT | Class 4 |
| PD Sniper | QRT/SWAT | Class 4 |

- High Command may use all department-authorized weapons.
- Officers may not carry weapons above their rank or certification.
- Weapon privileges may be revoked for misuse.

### 3.3 Ammunition Limits

| Weapon | Maximum Ammunition |
|---|---:|
| PD 57 | 150 pistol rounds |
| PD SMG | 200 SMG rounds |
| PD Glock | 100 pistol rounds |
| PD M4 | 150 rifle rounds |

### 3.4 Bodycam Regulations
- In-city and in-head bodycams must be active while on duty.
- OBS recording is recommended for full-session documentation.
- Officers should record scenes from beginning to end.
- Footage must support probable cause and relevant evidence.
- Bodycam footage may not be deleted within 24 hours of recording.
- Bodycams are not automatically uploaded; officers must return to HQ to collect an unbroken bodycam.
- If a suspect uses `/me breaks bodycam`, footage from that scene is considered invalid under the department''s roleplay rules. Officers must not rely on the invalidated footage.

### 3.5 Uniform and Vehicle Regulations
- Officers must wear approved department uniforms.
- Gang accessories and excessively large chains are prohibited.
- Masks are restricted to approved divisions.
- Face tattoos and face paint are prohibited.
- Emergency lights are required until Command rank.
- Liveries may be removed at Corporal rank.
- One interceptor is permitted per four four-door patrol units, with one interceptor per pursuit. Dispatch must be checked before taking another interceptor.

**Vehicle color permissions:**
- Supervisor+: Grey with livery or slicktop.
- Command+: Black or white, marked or unmarked.
- Detective vehicle permissions follow their approved detective rank.
- Other colors require High Command approval.

---',3),
  ('4','SEARCH, SEIZURE AND PROBABLE CAUSE','### 4.1 Reasonable Suspicion
- Reasonable suspicion allows an officer to temporarily detain someone for investigation.
- Reasonable suspicion alone does not authorize a search.
- Officers must explain that the detention is investigative and not automatically an arrest.
- Maximum investigative detention is **25 in-head minutes**.

### 4.2 Probable Cause
- Probable cause requires evidence connecting an individual to a suspected offense.
- Examples include witnessing a crime, matching evidence, or discovering relevant contraband during a lawful investigation.
- Probable cause may support an arrest or search when applicable.

### 4.3 Search and Seizure
- Searches require probable cause or explicit consent.
- Officers may conduct a lawful field search when the required justification exists.
- Contraband and relevant evidence may be seized in the field or at HQ.
- Officers must document confiscated evidence.

### 4.4 Shots-Fired Investigations
- GSR testing does not require consent during a 10-13 investigation.
- A negative GSR result means the suspect should not be searched on that basis and should be released unless other grounds exist.
- A positive result may support further investigation and detention.
- Officers may look for relevant shell casings.
- A discovered casing may support a frisk for a weapon.
- Weapon serial numbers should be crossmatched with recovered evidence.
- Officers must consider possible self-defense claims.

### 4.5 Drug-Sale Investigations
- Non-K9 officers must have bodycam footage of a confirmed handoff before engaging a suspect, unless an immediate threat or ongoing criminal activity requires action.
- Officers should investigate and communicate appropriately before proceeding.
- A confirmed handoff may establish grounds for arrest.
- Officers should not immediately draw weapons without justification.
- After cuffing, medical attention should be provided when needed before searches.
- Connected vehicles may be searched when legally justified.
- Illegal drugs and relevant items may be confiscated.
- K9 deployment requires clear and reasonable suspicion and may not be used indiscriminately during routine traffic stops.

---',4),
  ('5','USE OF FORCE','### 5.1 General Principles
Officers must use only the force reasonably necessary for the situation. Preservation of life and public safety must remain priorities.

| Level | Type of Force |
|---|---|
| Level 1 | Officer presence |
| Level 2 | Verbal communication |
| Level 3 | Hand-to-hand / tackling |
| Level 4 | Non-lethal force |
| Level 5 | Deadly force |

- Officers should communicate before escalating whenever possible.
- Force must match the threat presented.
- Deadly force requires an immediate and serious threat.
- Officers must not use force as punishment or retaliation.

### 5.2 Matching Force
- Officers must assess the threat before escalating.
- A person brandishing a weapon should receive a verbal command to drop it when circumstances allow.
- A weapon pointed at an officer or civilian presents an immediate safety concern.
- When an officer activates a panic button or goes down, responding officers may use force appropriate to the threat.

### 5.3 Taser Regulations
- Verbal warnings must be given before deployment when possible.
- Officers must announce when they are going for a taser.
- A 15-second interval is required between taser shots.
- Repeated or unnecessary taser use is prohibited.
- Officers must avoid deployment near dangerous drops, ladders, or other hazardous locations.
- Officers must take immediate steps to protect anyone tased in water from drowning risk.
- A suspect attempting to enter a vehicle may be tased before entry when justified.
- A suspect already inside a vehicle may be tased after announcing deployment when justified.

**Code Red Exception:**
- Code Red applies when a suspect has injured or attempted to injure a Law Enforcement Officer (LEO).
- During a confirmed Code Red situation, normal restrictions on tasing a fleeing suspect are waived.
- Officers may tase the identified suspect while they are running without following the usual warning and pursuit restrictions.
- This exception applies to the suspect responsible for the injury or attempted injury, not uninvolved individuals.
- Officers must communicate the Code Red status over the radio.
- Code Red does not automatically authorize lethal force. Any escalation beyond non-lethal force must still be justified by the situation.

### 5.4 Tackling and Cuffing
- Officers must announce a tackle and give a warning when possible.
- Repeated tackling without an opportunity to comply is prohibited.
- Allow a tackled suspect a reasonable opportunity to surrender.
- Officers must instruct suspects to raise their hands and face away before cuffing when circumstances allow.
- Officers must announce when they are going for cuffs.
- Power cuffing while a person is running or walking is prohibited.
- Spamming cuffs is prohibited.
- Hard cuffs are a last resort for situations involving improper roleplay and may result in discipline if abused.

### 5.5 Non-Lethal Shotgun
- It may not be used as a primary taser.
- A 10-second cooldown is required between shots.
- Command+ authorization and the required certification are necessary.
- Verbal commands must be given before use when possible.
- Abuse may result in revoked privileges and disciplinary action.

### 5.6 Police Shields
- Only the approved black Police Shield is permitted.
- Maximum of three shields per scene.
- Class 1 weapons only while a shield is equipped.
- Shields are restricted to approved situations, including robberies, MLO breaches, gang blocks, signed warrants, crowd control, prison transports, and hostage rescues.

---',5),
  ('6','ARRESTS AND PROCESSING','### 6.1 General Arrest Procedure
- Officers must have appropriate grounds before making an arrest.
- The primary officer should transport the arrested suspect.
- A secondary officer may assist when multiple suspects require transportation.
- Other officers should return to patrol once the scene is Code 4 unless handling evidence.
- Additional units may escort processing officers when a breakout attempt is suspected.

### 6.2 Processing Procedure
Officers must:
1. Read Miranda Rights when the suspect is in custody and is about to be questioned.
2. Ask whether the suspect wants an available lawyer.
3. Allow the suspect to contact DOJ services once uncuffed in the cells if a lawyer is requested.
4. Ask whether medical attention is required and contact EMS when necessary.
5. Conduct a final search in the station garage.
6. Obtain a clear mugshot and fingerprints.
7. Remove masks or obstructing accessories when necessary for identification.
8. Complete the MDT report and enter the appropriate charges.

- Requesting a lawyer does not automatically reduce jail time.
- Failure to provide fingerprints results in the maximum fine and sentence under department rules.
- If a suspect is fully down, CPR must be provided until EMS arrives.

### 6.3 Holding Cells
- Maximum holding time is **25 in-head minutes**.
- A suspect requesting a lawyer may be held until their lawyer arrives.

### 6.4 Maximum Penalties
**Maximum fine: $300,000**

**Maximum sentence: 300 months**

- Officers must follow the approved sentencing regulations.
- Officers may add one month per $1,000 in unpaid fines, subject to the overall maximum sentence.
- Officers may reduce a sentence by 50% when a suspect pleads guilty. This is at the arresting officer''s discretion.

---',6),
  ('7','FINES AND SENTENCING REGULATIONS','### 7.1 General Sentencing
- Charges must accurately reflect the suspect''s actions.
- Officers must not invent, exaggerate, or add unsupported charges.
- All fines and sentences must remain within department limits.
- The maximum fine is **$300,000**.
- The maximum jail sentence is **300 months**.

### 7.2 Unpaid Fines
- If a suspect cannot pay the full fine, officers may add one month of jail time per $1,000 owed.
- Added time may not exceed the 300-month overall maximum.

### 7.3 Guilty Pleas
- Officers may reduce the sentence by 50% when a suspect pleads guilty.
- This reduction is discretionary and must be applied consistently.

### 7.4 Documentation
- All charges, fines, and sentences must be entered correctly in the MDT.
- Officers must ensure the final sentence does not exceed the department maximums.
- Any unusual sentencing decision should be documented.

---',7),
  ('8','WEAPON CONFISCATION AND BUYBACKS','### 8.1 Weapon Confiscation
Every confiscated firearm requires:
- An MDT report, even if no arrest is made.
- A Dyno log in `#weapon-confiscation`.
- A weapon-strike check when applicable.
- Placement in the appropriate Criminal CID evidence stash.
- Proper documentation if a suspect escapes or leaves the scene.

### 8.2 Confiscation Rules

| Circumstance | Required Action |
|---|---|
| Gun not used, valid license | Return before jailing |
| Gun not used, no license | $50,000 charge; return before jailing |
| Gun used in violent crime | Confiscate and apply weapon strike |

- Weapon strikes are tied to individual serial numbers.
- Officers must record the strike number in the MDT report.

### 8.3 Weapon Strike System

| Strike | Consequence |
|---|---|
| 1st | First offense recorded |
| 2nd | Second offense recorded |
| 3rd | Permanent confiscation |

### 8.4 Weapon Buybacks
- Only F9-registered weapons qualify.
- Non-F9 weapons are not eligible.
- Weapons with three or more violent strikes are ineligible.
- A weapon license is not required for a buyback.
- All buybacks must be recorded using Dyno in `#gun-buyback`.
- Failure to log a buyback may be treated as PD corruption.

| Weapon Class | Buyback Price |
|---|---:|
| Class 1 | $100,000 |
| Class 2 | $200,000 |
| Class 3 | $300,000 |

### 8.5 Weapon Licenses
- Licenses are issued only to individuals with clean records.
- Previous convictions must be expunged before obtaining a license.
- Licenses may be revoked when weapons are used in violent felonies.
- Self-defense may be considered an exception when supported by bodycam evidence.

---',8),
  ('9','WARRANTS AND SEARCH WARRANTS','### 9.1 Official Warrants
- Official warrants are issued by Detectives/FIB through the MDT.
- Warrants remain valid for one week.
- Warrants are dropped if the suspect cannot be located within that period.
- Officers may attempt service at a player''s location once every two hours.
- If the suspect is not present, officers must leave.

### 9.2 Unofficial In-City Warrants
- Corporal+ may issue unofficial warrants over the radio.
- Proper bodycam footage and evidence are required.
- Unofficial warrants last three in-head hours.
- They cannot be entered into the MDT.
- They must be communicated verbally through radio.
- They are limited to eligible criminal charges under current department rules.

### 9.3 Search Warrants
- Detectives may request search warrants through DOJ Discord.
- Proper supporting evidence is required.
- Search warrants may be used to collect evidence or make an arrest inside a property.
- A signed warrant is required before breaching a player''s house.
- Unauthorized property breaches may result in SOP violations or PD corruption.

### 9.4 Green Zone Restrictions and Sting Operations
- Warrants may not normally be served inside designated Green Zones.
- Officers may not use warrants as an excuse to initiate prohibited interactions inside a Green Zone.
- **Exception — Undercover Operations and Sting Operations:** Officers may conduct approved undercover operations, controlled buys, and sting operations inside Green Zones.
- If an individual publicly advertises illegal activity, such as selling drugs through an in-game website, officers may respond to the advertisement and investigate.
- Officers must not pressure, threaten, or repeatedly persuade an individual into committing an offense they were not already willing to commit.
- Officers must have a legitimate investigative reason for the operation.
- All operations must follow department procedures and be properly documented.

---',9),
  ('10','BAIL AND EXPUNGEMENTS','### 10.1 Bail Eligibility
- Bail is generally available for non-violent crimes.
- Officers have discretion over whether to accept bail.
- Bail for violent crimes requires High Command approval.
- Suspects must plead guilty to accept bail.
- A suspect who accepts bail may not later challenge the charges through DOJ.
- Officers must explain this condition before accepting bail.

### 10.2 Bail Fees
- Bail costs $1,000 per month of the original sentence.
- Bail is added on top of the original fine.

**Example:**
- Original fine: $50,000
- Original sentence: 50 months
- Bail amount: $50,000
- Total payment: $100,000

### 10.3 Expungements
- At least 24 hours must pass before an expungement.
- Each charge costs $10,000.
- Officers must remove the eligible charge from the incident.
- The incident must be saved after the change.
- A note must be added to the individual''s profile.
- PD handles expungements until responsibility is formally transferred to DOJ.

---',10),
  ('11','VEHICLE IMPOUNDING','### 11.1 Impound Procedure
Officers must use `/impound` and complete:
- Impounded by.
- Reason for impound.
- Release fee.
- Whether the vehicle is retrievable by its owner.

### 11.2 Impound Fees

| Offense | Fee | Hold Time |
|---|---:|---|
| Illegal parking | $500 | Instant |
| Reckless driving | $1,000 | Instant |
| Hit and run | $1,500 | Instant |
| Stolen vehicle | $2,000 | Instant |
| Vehicle pursuit (10-80) | $3,000 | 2 hours |
| Drug sale / trafficking | $3,000 | 2 hours |
| Shooting | $7,500 | 2 hours |
| Officer-involved shooting | $10,000 | 3 hours |

### 11.3 Impound Accountability
- Fees and hold times must match the applicable offense.
- Officers must not impound vehicles without a valid reason.
- All impounds must be properly documented.

---',11),
  ('12','PATROL AND COMMUNICATIONS','### 12.1 Radio Channels

| Channel | Purpose |
|---|---|
| Channel 1 | Active LSPD radio |
| Channel 2 | EMS |
| Channel 3 | Busy / writing reports |
| Channel 4 | Active training |
| Channel 5 | DOJ |

### 12.2 Radio Regulations
- Keep radio traffic clear and professional.
- Avoid extended personal conversations.
- Wait approximately 3–5 seconds after another callout before transmitting.
- Officers should know and correctly use department 10-codes.
- Important scene updates must be communicated to dispatch.

### 12.3 Patrol Regulations
- Follow traffic laws while patrolling.
- Treat traffic lights as stop signs under department rules.
- Use emergency lights and sirens appropriately.
- Maintain approved uniforms and vehicles.
- Respond to requests for additional units unless occupied with a report or higher-priority responsibility.

### 12.4 Response Codes

| Code | Meaning |
|---|---|
| Code 1 | Normal response; no emergency lights |
| Code 2 | Emergency lights; no sirens |
| Code 3 | Emergency lights and sirens |

---',12),
  ('13','TRAFFIC STOPS AND FELONY STOPS','### 13.1 Routine Traffic Stops
- Traffic stops must have an appropriate reason, such as a traffic violation.
- Activate emergency lights and sirens to signal the driver.
- Once the vehicle stops, turn off sirens while keeping lights active.
- Officers must introduce themselves professionally.
- Request the driver''s license, registration, and insurance.
- Check the driver''s information and outstanding warrants.
- Check whether the vehicle is stolen.
- Officers may issue a warning or ticket when appropriate.
- Tickets must be roleplayed and entered using the correct fine command.
- Only one additional unit should respond to a routine traffic-stop backup request.

### 13.2 Code 5 Felony Stops
- A Code 5 stop requires probable cause.
- Additional units should be requested.
- Officers must coordinate through radio.
- The primary officer directs the stop.
- All occupants must be accounted for.
- The vehicle should be checked after occupants are secured.

### 13.3 MDT Vehicle BOLOs
- Vehicle BOLOs last a maximum of 30 minutes.
- Proper roleplay interaction is required before issuing one.
- Valid reasons include:
  - Losing sight of a vehicle during a 10-80.
  - Vehicle involvement in shots fired.
  - Vehicle involvement in a bank robbery.
  - Confirmed drug sales.
- BOLOs must be deleted or checked after 30 minutes.

---',13),
  ('14','SCENE CONDUCT AND T-COUNT','### 14.1 General Scene Conduct
- Officers must match the opposing side''s force.
- PD should maintain an equal T-count or no more than one additional officer, subject to listed exceptions.
- Officers must not exceed the applicable scene limit.
- Panic buttons and 10-99 calls are exceptions to normal limits.
- Officers must coordinate scene attendance through radio.

### 14.2 Standard T-Count Limits

| Situation | T-Count |
|---|---:|
| Officer in distress | No maximum |
| Other heists | Maximum 8 |
| Fleecas | Maximum 8 |
| Gang vs. gang shootouts | Maximum 15 |
| House / store / bank truck / cargo | Maximum 8 |
| Gang-block calls | Maximum 8 |
| Traffic stops | Maximum 6 |
| Felony stops | Maximum 10 |
| Other scenes | Maximum 8 |

### 14.3 Gang-Block Requirements
- A minimum of five officers must be on duty before responding to a gang-block call.
- Officers must never respond to gang-block calls alone.
- The gang-block maximum is eight officers.
- Officers must follow the special gang-scene rules in Section 17.

### 14.4 Pursuit Attendance Limits

| Pursuit Status | Maximum Vehicles | Maximum Officers Alive |
|---|---:|---:|
| Code Green | 3 | 6 |
| Code Yellow | 4 | 8 |
| Code Red | 5 | 8 |

### 14.5 Exceptions
- Officer distress and 10-99 situations have no maximum officer count.
- Officers must still communicate and coordinate their response.
- These exceptions must not be used to bypass normal T-count restrictions without a valid reason.

---',14),
  ('15','VEHICLE PURSUITS AND SCENE CODES','### 15.1 General Pursuit Regulations
- Public safety must remain a priority.
- Dispatch must be informed when a 10-80 begins.
- Officers must provide the vehicle description, occupancy, location, and direction of travel.
- Officers involved in crashes must report them.
- Pursuits are not races.
- Officers must maintain assigned positions and communicate when changing positions.

### 15.2 Pursuit Positions

| Position | Responsibility |
|---|---|
| Primary | Leads the pursuit |
| Secondary | Maintains communication and callouts |
| Tertiary | Supports the pursuit and monitors outside interference |
| Air-1 | Takes over callouts when active |

### 15.3 Scene and Pursuit Codes

| Code | Meaning |
|---|---|
| **Code Green** | Scene is clear and under control. Officers are good to go. |
| **Code Yellow** | Scene has just started or is continuing. No active violence is occurring. |
| **Code Orange** | Situation is escalating. Physical confrontations, aggression, or violence are beginning. |
| **Code Red** | A suspect has injured or attempted to injure a Law Enforcement Officer (LEO). Special officer-safety procedures apply. |

**Additional Code Regulations:**
- Officers must communicate code changes over the radio.
- Codes must reflect the current situation and may change as the scene develops.
- Code Orange does not automatically authorize the special Code Red exception.
- Code Red applies to the suspect responsible for injuring or attempting to injure an LEO.
- Code Red does not automatically authorize deadly force.
- Officers must follow the Code Red exception outlined in Section 5.3.

### 15.4 PIT Regulations
- PIT maneuvers require the appropriate pursuit status and authorization.
- Senior Officer+ or the highest-ranking active officer must confirm the status.
- City speed maximum: 100 MPH.
- Highway, freeway, and bridge speed maximum: 140 MPH, subject to pursuit status.
- A one-minute PIT timer is required.
- The timer may be requested 30 seconds after Code Yellow.
- A 30-second cooldown applies between PIT attempts.
- The highest-ranking officer on duty must authorize the timer.

### 15.5 Additional Pursuit Rules
- The updated PIT timer applies after all three strikes.
- Outside vehicles interfering with a pursuit may also receive pursuit codes.
- A 30-minute cooldown applies to locating suspects or vehicles.
- Reasonable suspicion is required before further action.

### 15.6 Air-1 Pursuit Rules
- A co-pilot is mandatory.
- Air-1 takes over pursuit callouts when active.
- The co-pilot is responsible for communications.
- Additional Air-1 requirements are covered by its separate division SOP.

---',15),
  ('16','FOOT AND WATER PURSUITS','### 16.1 Foot Pursuits
- Officers must follow department foot-pursuit procedures.
- Verbal warnings are required when possible.
- Taser and tackle policies remain in effect, including the Code Red exception.
- Cuffing is permitted when a suspect is appropriately secured.
- Officers must follow applicable rules when suspects reach for weapons or enter water.
- All actions must be properly roleplayed and justified.

### 16.2 Water Pursuits
- Officers must use an authorized police boat.
- Jet skis are prohibited for police pursuit operations.
- Ramming with police boats or jet skis is prohibited.
- Police may commission boats when the situation requires it.
- Officers must prioritize safety and follow department instructions.

---',16),
  ('17','GANG-RELATED INCIDENTS','### 17.1 Gang vs. Gang Scenes
- Gang vs. gang scenes are restricted to designated gang blocks.
- Officers must prioritize officer safety and secure the scene.
- Gangs must be separated by color.
- Injured and deceased individuals must be included in scene management.
- Weapons must not be confiscated under the special gang-scene procedure.
- Officers should contact Detectives or collect relevant evidence when possible.

### 17.2 Gang Scene Fines
- The gang-related shooting fine is **$50,000 per member**.
- The fine must be applied consistently to each eligible member.
- All charges must be documented correctly.

### 17.3 Gang Scene Restrictions
- Officers must follow the applicable gang-scene roleplay rules.
- Arrests and incidents must be based on qualifying conduct and the current scene rules.
- Officers must not use gang-scene exceptions to bypass normal evidence and documentation requirements.

---',17),
  ('18','HOSTAGE SITUATIONS','### 18.1 Primary Objective
- Preservation of life is the highest priority.
- Hostage safety takes precedence over immediate suspect apprehension.
- Officers must allow realistic and fair roleplay.

### 18.2 Initial Response
- Establish a perimeter.
- Assign a primary negotiator.
- Maintain controlled radio communications.
- Allow the situation to develop naturally.
- Avoid unnecessary interference with negotiations.

### 18.3 Negotiations
- Negotiations must be conducted in good faith.
- Suspect demands must be taken seriously.
- Officers may not intentionally stall negotiations for tactical advantages.
- Communication must remain professional and in character.
- Unrealistic demands should be negotiated rather than immediately dismissed.

### 18.4 Hostage Demands
- One demand is permitted per hostage.
- A maximum of three demands is permitted per scene.
- Physical item exchanges are prohibited.
- Acceptable demands may include safe passage and reasonable time allowances.

### 18.5 Prisoner Transport and Life-for-Life
- Sergeant+ officers have discretion to approve or deny prisoner transports as hostage demands.
- Decisions must consider officer headcount and city call volume.
- Prison transports and Life-for-Life exceptions are restricted to Gang Captain+.

### 18.6 Use of Force
- Force is a last resort.
- Lethal force requires lethal intent or an immediate serious threat.
- Major escalation must be justified by the roleplay.
- The highest-ranking officer on scene must approve major tactical escalation.
- Officers should not rush negotiations.

---',18),
  ('19','EMERGENCY RESPONSE PRIORITIES','### 19.1 Call Priority Chart

Officers should prioritize calls in the following order:

1. Officer in distress.
2. Prison transport.
3. Heists.
4. Hostage situations.
5. Gang vs. gang violence.
6. Multiple shots fired (more than two).
7. House/store robberies, bank trucks, and cargo boats.
8. All other calls.

### 19.2 Officer in Distress
- All available officers must prioritize responding.
- Officers processing suspects in cells are the exception.
- If multiple officers are processing, the lowest-ranking officer should remain to finish processing.
- Responding officers must coordinate through radio.

### 19.3 Response Accountability
- Officers must not ignore higher-priority calls without a valid reason.
- Supervisors may redirect units based on the situation.
- Officers must provide updates when they are unable to respond.

---',19),
  ('20','SWAT AND SPECIALIZED RESPONSE','### 20.1 SWAT Activation Requirements

| Activation Type | Minimum Operators |
|---|---:|
| Casual SWAT | 3 |
| Full SWAT | 4 |

### 20.2 Activation Regulations
- SWAT activation must follow the current personnel requirements.
- The chain of command must be respected.
- Officers must follow approved SWAT instructions and applicable certifications.
- Unauthorized activation or misuse of specialized equipment may result in discipline.

### 20.3 Specialized Units
- Specialized units must follow their approved division-specific SOPs.
- Division requirements and certifications must be maintained.
- Officers with three or more active strikes may not join divisions.
- Existing division members reaching three active strikes must be removed until eligible to reapply.
- Certifications are privileges and may be revoked for violations.

---',20),
  ('21','INTERNAL ACCOUNTABILITY AND DISCIPLINE','### 21.1 Professional Conduct
- Officers must remain professional while on duty.
- Abuse of rank, authority, equipment, or department privileges is prohibited.
- Corruption, favoritism, harassment, and deliberate misconduct may result in serious discipline.
- Officers must cooperate with legitimate internal investigations.

### 21.2 Internal Affairs
- Internal Affairs may review officer conduct and investigate alleged violations.
- Officers must provide requested evidence and cooperate with authorized investigations.
- Bodycam footage, MDT reports, and other relevant records must be preserved.
- Interfering with an investigation may result in additional discipline.

### 21.3 Strike System
- Department violations may result in strikes.
- Strike severity depends on the violation and available evidence.
- Officers with three or more active strikes are ineligible for division membership.
- Supervisors and Command may recommend disciplinary action through the chain of command.

### 21.4 Reporting and Documentation
- Reports must be accurate, complete, and submitted through approved channels.
- Officers must not falsify reports, evidence, or activity records.
- Confiscations, arrests, impounds, and other required actions must be logged.
- Failure to document required actions may result in discipline.

---',21),
  ('22','FINAL REGULATIONS AND AMENDMENTS','### 22.1 Compliance
- Every LSPD member is responsible for knowing and following this SOP.
- Ignorance of department policy is not an excuse for repeated violations.
- Supervisors are responsible for helping officers understand and follow these regulations.

### 22.2 Division-Specific SOPs
- Division-specific procedures remain in their respective division manuals.
- Division manuals may add requirements but may not override department-wide policy unless authorized by High Command.
- All division members must follow both this Master SOP and their applicable division SOP.

### 22.3 Amendments
- Xeno and the Commissioner leadership may review and approve department policy changes.
- Changes must be communicated through official department channels.
- Officers are responsible for following the most recently approved version.
- Conflicting or unclear rules should be referred to Command for clarification.

### 22.4 Final Authority
X-001 and X-002 hold the highest authority within the LSPD. The Commissioner, Assistant Commissioner, and Deputy Commissioner operate beneath Xeno leadership, followed by High Command and the remaining chain of command.

All officers are expected to maintain professionalism, accountability, and respect for the department.

**END OF LSPD MASTER STANDARD OPERATING PROCEDURES**',22)
) as v(section_number,title,content,sort_order)
where d.slug='lspd'
on conflict(department_id,section_number) do update
set title=excluded.title, content=excluded.content, sort_order=excluded.sort_order, published=true;
