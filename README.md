# SAFER-SPACES
DESIGNING SAFER SPACES TO MITIGATE AIRBORNE DISEASE 

Designing commercial interior spaces has many components that include a welcoming environment for visitors, sufficient seating, and the necessary technical equipment to support the modern office and lab. However, the largest costs for buildings are often in components not seen by visitors. One primary example is the cost of the heating, ventilation, and air conditioning (HVAC) systems in the building to allow for proper heating and cooling throughout the seasons. Many of the specifications for HVAC systems are based on the seasonal cooling capacity, the desired comfort level for the building occupants, and the type of activity that will occur in the building. With the recent pandemic and its airborne transmission potential, there is a renewed emphasis on HVAC systems to clean and condition the air in building spaces. 
You are retained by an architectural firm that is designing a mixed-use building, meaning that it will be used for more than one purpose. You are asked to consider the air safety, and possible countermeasures, to minimize the risk of viral particles from infected individuals that are in the building. In addition, to mitigate liability, the firm would like you to estimate exposure risks for infection based on different HVAC designs. 

BACKGROUND: 

Designing effective countermeasures for reducing or eliminating airborne viral transmission of respiratory viruses is one of the most difficult challenges for designing public spaces. The airborne transmission is difficult to stop quickly and effectively. Currently, there are no clean air technologies that will immediately kill all airborne viral particles. In addition, the infectious dose for novel viruses makes the design of different spaces even more complex because there are no clear health guidelines for designers. Without a minimum exposure level that would provide safety for all occupants, HVAC design firms need to estimate the infectious dose based on incomplete literature. 

How are HVAC systems specified? 

In general, circulating air in HVAC systems has two components: fresh air supplied from the outside, and recycled air that is recirculated from spaces in the building. The relative mix of fresh intake air to recycled air is one design parameter for a building HVAC system. The choice of mixture depends on many factors, some of which are mandated by construction building codes. For example, a building that contains office space can mix recycled air with conditioned air from the outside. In comparison, HVAC systems for chemistry lab spaces are forbidden to recycle any room air for safety reasons; 100% of the air delivered to the space must be taken from the outside and conditioned before entering the space. In these lab spaces, the same volume of air is exhausted from the space to the outside. 

A second general feature of a building HVAC system is filtering the particles from the air before it is delivered to interior spaces. The filtration system developed for HVAC systems, termed the Minimum Efficiency Reporting Value (MERV), assigns a rating to each HVAC system used in the building. The number rating assigned ranges from 1-20, where 1 indicates no filtering and 20 indicates a significant filtering system that removes 99.9999% of contaminants that are greater than 0.3-1.0 micron in diameter. Household air conditioning and heating systems often hold a MERV rating from 4-6, while most building codes require office spaces to achieve a MERV rating of 7 or better. Research labs are required to achieve a MERV rating of 11 or better. Across most buildings on the Penn campus, two-stage filtering systems are used on conditioned air – a first stage filtering at MERV 7 and a second stage filtering system of MERV 14/15. In comparisons, hospitals are required to achieve a MERV rating of 16 or better in their spaces. 
Although viral particles are small and can pass through even the more stringent filtering systems, the infection risk for viruses predominantly is from the virus packaged in small aerosolized particles expired by infected individuals. Some of these particles fall to the ground in <min, while smaller particles require hours to fall onto a surface. 

A final design feature in the heating and cooling systems is the number of air changes per hour (ACH) within a space, and how these air changes can vary over time to accommodate rapid heating or cooling. With the possible presence of chemicals and other irritants in the air, research labs often require 10-12 ACH, sometimes reaching as high as 20 ACH. In comparison, office spaces contain far fewer irritants and therefore require lower ACH – normally 2-3 ACH per hour is the typical rating for office spaces. 

What is an infectious dose of virus? 

As new infectious viruses enter the population, one key unknown is the amount of virus, or titer, required to infect a human. Some viruses require a direct contact with blood, and therefore can infect an individual when a cut occurs or an open sore is exposed to air containing the virus. The relative titer needed for infection is often low. Other viruses require only direct skin contact, but this mode of transmission is rare. For respiratory viruses, the most common model of infection is either through communication of the virus from self contact (e.g., an individual touches an infected surface and then rubs their eyes) or through inhalation of aerosolized particles. Influenza viruses commonly infect through the respiratory system, and estimates of the infectious titer for different influenza strains (e.g., H1N1, SARS, H3N2) often require years of careful study to establish the range of infectious titer for individuals of different age and backgrounds. In many instances, previous infectious dose estimates provide a guide until the medical evidence emerges for novel viruses. 

For this virus, you can estimate the infection probability risk (P) on the estimated number of viral particles inhaled by a person: 
<img width="198" alt="image" src="https://user-images.githubusercontent.com/79545637/197044980-79e15609-e86c-4c58-ad7a-3f096b53eae1.png">

where V is the number of particles inhaled by the individual and 0 < P < 1. A graph of this risk function is shown below:

<img width="507" alt="image" src="https://user-images.githubusercontent.com/79545637/197045409-955616de-e214-4906-8eff-1c8f62db9779.png">

How do we plan spaces that are safe?

With all of these variables to consider, building designers face many choices that are influenced by a number of factors including building codes, client preferences, budgetary constraints, or employee-based organizations.
An example: Designing a simple office space

Let’s combine all of these considerations together in modeling a simple interior space that contains an entry space, hallway, and an office area:

<img width="401" alt="image" src="https://user-images.githubusercontent.com/79545637/197045539-68f27b36-0581-474f-b258-8a9520401232.png">

The entry space and hallway can be considered as one contiguous space, which is colored in green. The office space is colored in red as a separate space. The office space has three separate doors that connect the space to the entry/hallway space.
The office space has 40% of its air volume supplied by outside air, and 60% supplied by air recirculated from the office space. With lighter traffic, the entry/hallway has 80% of its air recycled from the space. The office space has 4 air changes per hour, while the entry/hallway has 2 air changes per hour.
If we consider this as a mass transfer system, and consider the two compartments may have different viral particle concentrations([C1], [C2]):

<img width="523" alt="image" src="https://user-images.githubusercontent.com/79545637/197045925-b9ca9300-4811-47ac-91cd-5cce41f47294.png">

For filtering, you may assume that a MERV 7 filter will remove 95% of the infected particles, while a MERV 14 will remove 99% of the particles. Therefore:

<img width="261" alt="image" src="https://user-images.githubusercontent.com/79545637/197047787-300434de-95d2-4c2d-919a-5de9ef8b9779.png">

For this simple building, your entry/hallway has 5,000 ft3 of volume, and the office space is 15,000 ft3 . You cannot provide more air than you exhaust to either space, so:

<img width="128" alt="image" src="https://user-images.githubusercontent.com/79545637/197048095-1e55ebe4-c041-4a24-92ad-b31c9f420403.png">

Specifying the air changes per hour (ACH) allows one to determine the required exhaust airflow:

<img width="247" alt="image" src="https://user-images.githubusercontent.com/79545637/197048153-2646cdfc-763e-400c-b566-fecfa224953d.png">

Where (ACH) indicates the number of times the air is changed per hour and the flow rates (Q​i,j) are specified in ft3 /minute. For example, if the room has a volume of 6000 ft3 and has 3 air changes per hour, Qe = 18,000 ft3 /hr = 300 ft3 /min = 5 ft3 /sec.

The air exhausted to the filter unit will either filter the air and return it to the space (Q r,i) or exhaust the air to the out side(Q o,i). The air flow must be conserved:

<img width="126" alt="image" src="https://user-images.githubusercontent.com/79545637/197048829-4c7d919c-287b-43ea-9576-84cab9ee0d89.png">

The recycled airflow is a fraction of the airflow exiting the space (​χ r,i):

<img width="191" alt="image" src="https://user-images.githubusercontent.com/79545637/197048978-6874970e-2ae8-47cd-a1c7-798407193780.png">

<img width="193" alt="image" src="https://user-images.githubusercontent.com/79545637/197049121-855527a9-eec8-49e7-b831-c123cfb495ea.png">

If 20e7 viral particles are distributed in 200,000ft3 of office space using the HVAC design noted above (4 ACH, 60% recycle air for Office; 2 ACH, 80% recycled air for Entry/hallway) the change in viral concentration within the office and entry space is shown below:

<img width="381" alt="image" src="https://user-images.githubusercontent.com/79545637/197049465-d4ce984e-ca3e-403d-935a-3ba74654ad59.png">

If the air handling units for the office and entry/hallway are turned off, there are no air changes in either area. Virus transfers from one are to another via the doors. The resulting change in virus concentration across the two spaces is shown below:

<img width="337" alt="image" src="https://user-images.githubusercontent.com/79545637/197049535-4e8e0631-f51b-49c7-902f-a4331c267054.png">


Our Analysis:

Our building is a multi-use building. The floorplan for the two-floor building is below. You will be given volumes for each of these spaces. Every single volume of space has its own air handler. This means that 9 different HVAC units service the entire building. Assume each of the spaces has 10 ft ceiling heights. Also, unless otherwise specified, assume the doorways are modeled as membranes which are permeable to the virus, with P_doorway = 100 ft/min and A_doorway = 25 ft2 and the entry hall entrance door is closed. The entry hall connects the first and second floor, and is therefore assigned a common volume (V1)

<img width="437" alt="image" src="https://user-images.githubusercontent.com/79545637/197049838-bd2a19b6-780e-4925-91b4-0a5839500697.png">






