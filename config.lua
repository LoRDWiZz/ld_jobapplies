Config = {}

Config.Target = "OX" -- QB / OX

Config.PDWebHook = "" -- Your webhook for police applications
Config.EMSWebHook = "" -- Your webhook for EMS applications
Config.MechanicWebHook = "" -- Your webhook for mechanic applications

Config.Applys = {
    -- [1] = {
    --     type = "Type of job - police/ems/mechanic",
    --     name = "Name for apply",
    --     label = "Label to display",
    --     coords = vector4(),
    --     ped = false/true,
    --     pedModel = "Ped model",
    -- },

    -- FOR EXAMPLE:
    [1] = {
        type = "police",
        name = "mrpd",
        label = "Police applicaiton",
        coords = vector4(441.0, -980.25, 31.0, 0.0),
        ped = false,
        pedModel = "",
    },
    [2] = {
        type = "ems",
        name = "pillbox_hospital",
        label = "EMS applicaiton",
        coords = vector4(299.08, -584.64, 43.26, 71.61),
        ped = true,
        pedModel = "s_m_m_scientist_01",
    },
    [3] = {
        type = "mechanic",
        name = "ls_customs",
        label = "Mechanic applicaiton",
        coords = vector4(-355.44, -129.54, 39.43, 86.9),
        ped = true,
        pedModel = "s_m_m_lathandy_01",
    },
}