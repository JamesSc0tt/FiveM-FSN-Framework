-- Groups from https://gtamods.com/wiki/Handling.meta

Field "string" "handlingName"
	Source "HandlingName"

--[[
	Physical Attributes
]]
Group "Physical"
	--Name "Physical Attributes"
	--Desc "These seven values represent the vehicle's physical proportions within the game."

Field "float" "fMass"
	Source "Mass"
	Default (1900)

Field "float" "fInitialDragCoeff"
	Source "InitialDragCoeff"
	Default (7.52)

Field "float" "fDownforceModifier"
	Source "DownforceModifier"
	Default (1.29)

Field "float" "fPercentSubmerged"
	Source "PercentSubmerged"
	Default (78)

Field "vector" "vecCentreOfMassOffset"
	Source "CentreOfMassOffset"
	Default {0, -0.06, 0.02}

Field "vector" "vecInertiaMultiplier"
	Source "InertiaMultiplier"
	Default {1.16, 1, 1.62}

--[[
	Transmission Attributes
]]
Group "Transmission"
	--Name "Transmission Attributes"
	--Desc "These values describe the vehicle's straight line performance. Rate of acceleration is determined by fDriveBiasFront, nInitialDriveGears, fInitialDriveForce, fDriveInertia, and fInitialDriveMaxFlatVel. Rate of deceleration is determined by fBrakeForce and fBrakeBiasFront. fSteeringLock can be thought of as a measure of sideways acceleration."

Field "float" "fDriveBiasFront"
	Source "DriveBiasFront"
	Default (0)


Field "integer" "nInitialDriveGears"
	Source "InitialDriveGears"
	Default (6)
	Limit { Min = 1 }

Field "float" "fInitialDriveForce"
	Source "InitialDriveForce"
	Default (0.261)

Field "float" "fDriveInertia"
	Source "DriveInertia"
	Default (0.99)

Field "float" "fClutchChangeRateScaleUpShift"
	Source "ClutchChangeRateScaleUpShift"
	Default (1.8)

Field "float" "fClutchChangeRateScaleDownShift"
	Source "ClutchChangeRateScaleDownShift"
	Default (2)

Field "float" "fInitialDriveMaxFlatVel"
	Source "InitialDriveMaxFlatVel"
	Default (157)

Field "float" "fSteeringLock"
	Source "SteeringLock"
	Default (33.4)

--[[
	Brake Attributes
]]
Group "Brake"
	--Name "Brake Attributes"
	--Desc "These seven values represent the vehicle's physical proportions within the game."

Field "float" "fBrakeForce"
	Source "BrakeForce"
	Default (0.455)

Field "float" "fBrakeBiasFront"
	Source "BrakeBiasFront"
	Default (0.48129)

Field "float" "fHandBrakeForce"
	Source "HandBrakeForce"
	Default (0.8)

--[[
	Traction
]]
Group "Traction"
	--Name "Wheel Traction Attributes"
	--Desc "The following attributes describe how the vehicle will behave dynamically, from negotiating corners to acceleration and deceleration. This section has been updated from previous game versions."

Field "float" "fTractionCurveMax"
	Source "TractionCurveMax"
	Default (1.97)

Field "float" "fTractionCurveMin"
	Source "TractionCurveMin"
	Default (1.84)

Field "float" "fTractionCurveLateral"
	Source "TractionCurveLateral"
	Default (16.5)

Field "float" "fTractionSpringDeltaMax"
	Source "TractionSpringDeltaMax"
	Default (0.132)

Field "float" "fLowSpeedTractionLossMult"
	Source "LowSpeedTractionLossMult"
	Default (1.12)

Field "float" "fCamberStiffnesss"
	Source "CamberStiffnesss"
	Default (0)

Field "float" "fTractionBiasFront"
	Source "TractionBiasFront"
	Default (0.4824)
	Limit { Min = 0.01, Max = 0.99 }

Field "float" "fTractionLossMult"
	Source "TractionLossMult"
	Default (1.25)

--[[
	Suspension Attributes
]]
Group "Suspension"
	--Name "Suspension Attributes"
	--Desc ""

Field "float" "fSuspensionForce"
	Source "SuspensionForce"
	Default (2.61)

Field "float" "fSuspensionCompDamp"
	Source "SuspensionCompDamp"
	Default (1.34)

Field "float" "fSuspensionReboundDamp"
	Source "SuspensionReboundDamp"
	Default (0.46)

Field "float" "fSuspensionUpperLimit"
	Source "SuspensionUpperLimit"
	Default (0.129)

Field "float" "fSuspensionLowerLimit"
	Source "SuspensionLowerLimit"
	Default (-0.136)

Field "float" "fSuspensionRaise"
	Source "SuspensionRaise"
	Default (0)

Field "float" "fSuspensionBiasFront"
	Source "SuspensionBiasFront"
	Default (0.451)

Field "float" "fAntiRollBarForce"
	Source "AntiRollBarForce"
	Default (0)

Field "float" "fAntiRollBarBiasFront"
	Source "AntiRollBarBiasFront"
	Default (0.53)

Field "float" "fRollCentreHeightFront"
	Source "RollCentreHeightFront"
	Default (0.399)

Field "float" "fRollCentreHeightRear"
	Source "RollCentreHeightRear"
	Default (0.397)

--[[
	Damage Attributes
]]
Group "Damage"
	--Name "Damage Attributes"
	--Desc "The following attributes dictate how the vehicle will react to damaging effects."

Field "float" "fCollisionDamageMult"
	Source "CollisionDamageMult"
	Default (0.7)

Field "float" "fWeaponDamageMult"
	Source "WeaponDamageMult"
	Default (0.7)

Field "float" "fDeformationDamageMult"
	Source "DeformationDamageMult"
	Default (0.7)

Field "float" "fEngineDamageMult"
	Source "EngineDamageMult"
	Default (1.3)

Field "float" "fPetrolTankVolume"
	Source "PetrolTankVolume"
	Default (65)

Field "float" "fOilVolume"
	Source "OilVolume"
	Default (5)

--[[
	Misc Attributes
]]
Group "Misc"
	--Name "Misc Attributes"
	--Desc ""

Field "float" "fSeatOffsetDistX"
	Source "SeatOffsetDistX"
	Default (0)

Field "float" "fSeatOffsetDistY"
	Source "SeatOffsetDistY"
	Default (-0.15)

Field "float" "fSeatOffsetDistZ"
	Source "SeatOffsetDistZ"
	Default (0)

Field "integer" "nMonetaryValue"
	Source "MonetaryValue"
	Default (65000)

Field "string" "strModelFlags"
	Source "ModelFlags"
	Default "440010"

Field "string" "strHandlingFlags"
	Source "HandlingFlags"
	Default "820100"

Field "string" "strDamageFlags"
	Source "DamageFlags"
	Default "0"

Field "string" "AIHandling"
	Default "AVERAGE"

-- This one is weird and special
Field "SubHandlingData" "SubHandlingData"
	Default {
		CCarHandlingData {
			BackEndPopUpCarImpulseMult      = 0.05,
			BackEndPopUpBuildingImpulseMult = 0.03,
			BackEndPopUpMaxDeltaSpeed       = 0.6,
			ChamberFront			= 0.0,
			CamberRear			= 0.0,
			Castor				= 0.0,
			ToeFront			= 0.0,
			ToeRear				= 0.0,
			EngineResistance		= 0.0,
		}
	}
