-- Vans
return {
	CHandlingData {
		HandlingName = "BISON",
		-- Physical
		Mass               = 3200,
		InitialDragCoeff   = 2.58,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.27, -0.148 },
		InertiaMultiplier  = { 1.16, 1,    1.18 },

		-- Transmission
		DriveBiasFront                 = 0.245,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.235,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 166,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.511,
		BrakeBiasFront = 0.5996,
		HandBrakeForce = 0.65,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.81,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.135,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4855,
		TractionLossMult         = 0.9,

		-- Suspension
		SuspensionForce       = 2.05,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.171,
		SuspensionLowerLimit  = -0.152,
		SuspensionRaise		  = -0.021,
		SuspensionBiasFront   = 0.581,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.58,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 70.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.2,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '400010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BOBCATXl",
		-- Physical
		Mass               = 2600,
		InitialDragCoeff   = 2.51,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.13, -0.22 },
		InertiaMultiplier  = { 0.85, 0.85,    0.88 },

		-- Transmission
		DriveBiasFront                 = 0.23,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.213,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 157,
		SteeringLock                   = 36.0,

		-- Brake
		BrakeForce     = 0.48,
		BrakeBiasFront = 0.6226,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.79,
		TractionCurveLateral	 = 16.0,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4806,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 1.72,
		SuspensionCompDamp    = 2.05,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.185,
		SuspensionLowerLimit  = -0.2,
		SuspensionRaise		  = 0.005,
		SuspensionBiasFront   = 0.58,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.45,
		RollCentreHeightFront = 0.24,
		RollCentreHeightRear  = 0.25,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "CAMPER", 
		-- Physical
		Mass               = 3600,
		InitialDragCoeff   = 2.32,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.42, 0.47 },
		InertiaMultiplier  = { 1, 1.1,    1.2 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.15,
		DriveInertia                   = 0.7,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 128,
		SteeringLock                   = 38.0,

		-- Brake
		BrakeForce     = 0.369,
		BrakeBiasFront = 0.5465,
		HandBrakeForce = 0.29,

		-- Traction
		TractionCurveMax         = 1.87,
		TractionCurveMin         = 1.68,
		TractionCurveLateral	 = 15.4,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4809,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 1.73,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.125,
		SuspensionLowerLimit  = -0.153,
		SuspensionRaise		  = 0.028,
		SuspensionBiasFront   = 0.517,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.8,
		RollCentreHeightFront = 0.8,
		RollCentreHeightRear  = 0.8,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '444048',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "GBURRITO",
		-- Physical
		Mass               = 2750,
		InitialDragCoeff   = 2.3,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0, 0.01 },
		InertiaMultiplier  = { 1, 1.11,    1.46 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.204,
		DriveInertia                   = 0.85,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 151,
		SteeringLock                   = 35.4,

		-- Brake
		BrakeForce     = 0.484,
		BrakeBiasFront = 0.5571,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.74,
		TractionCurveLateral	 = 14.8,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4843,
		TractionLossMult         = 1.14,

		-- Suspension
		SuspensionForce       = 1.53,
		SuspensionCompDamp    = 1.54,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.476,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.5,
		RollCentreHeightRear  = 0.5,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 22000,
		ModelFlags		= '444010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "GBURRITO2",
		-- Physical
		Mass               = 2750,
		InitialDragCoeff   = 2.3,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0, 0.01 },
		InertiaMultiplier  = { 1, 1.11,    1.46 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.204,
		DriveInertia                   = 0.85,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 159,
		SteeringLock                   = 35.4,

		-- Brake
		BrakeForce     = 0.484,
		BrakeBiasFront = 0.5571,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.84,
		TractionCurveLateral	 = 14.8,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4843,
		TractionLossMult         = 1.14,

		-- Suspension
		SuspensionForce       = 1.53,
		SuspensionCompDamp    = 1.54,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.476,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.5,
		RollCentreHeightRear  = 0.5,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.4,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 22000,
		ModelFlags		= '444010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "JOURNEY",
		-- Physical
		Mass               = 4000,
		InitialDragCoeff   = 6.0,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0, 0 },
		InertiaMultiplier  = { 1, 1.4,    1.5 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.13,
		DriveInertia                   = 0.7,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 110,
		SteeringLock                   = 40.0,

		-- Brake
		BrakeForce     = 0.45,
		BrakeBiasFront = 0.6,
		HandBrakeForce = 0.3,

		-- Traction
		TractionCurveMax         = 1.4,
		TractionCurveMin         = 1.3,
		TractionCurveLateral	 = 15.0,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1.0,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.46,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 0.7,
		SuspensionReboundDamp = 1.0,
		SuspensionUpperLimit  = 0.15,
		SuspensionLowerLimit  = -0.16,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.48,
		AntiRollBarBiasFront  = 0.3,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '224048',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "MINIVAN",
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.05,
		DownforceModifier  = 1.18,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.151, 0.01 },
		InertiaMultiplier  = { 1.18, 0.99,    1.6 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.192,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 134,
		SteeringLock                   = 33.0,

		-- Brake
		BrakeForce     = 0.415,
		BrakeBiasFront = 0.4751,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.93,
		TractionCurveMin         = 1.802,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.138,
		LowSpeedTractionLossMult = 0.06,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4794,
		TractionLossMult         = 1.21,

		-- Suspension
		SuspensionForce       = 2.26,
		SuspensionCompDamp    = 1.54,
		SuspensionReboundDamp = 0.395,
		SuspensionUpperLimit  = 0.133,
		SuspensionLowerLimit  = -0.148,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.45,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.569,
		RollCentreHeightRear  = 0.565,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.08,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "MINIVAN2",
		-- Physical
		Mass               = 2100,
		InitialDragCoeff   = 2.24,
		DownforceModifier  = 1.21,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.131, -0.04 },
		InertiaMultiplier  = { 1.18, 1.02,    1.62 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.221,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 142,
		SteeringLock                   = 33.0,

		-- Brake
		BrakeForce     = 0.425,
		BrakeBiasFront = 0.4607,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.767,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.135,
		LowSpeedTractionLossMult = 1.14,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4832,
		TractionLossMult         = 1.11,

		-- Suspension
		SuspensionForce       = 2.25,
		SuspensionCompDamp    = 1.38,
		SuspensionReboundDamp = 1.25,
		SuspensionUpperLimit  = 0.101,
		SuspensionLowerLimit  = -0.18,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.456,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.521,
		RollCentreHeightRear  = 0.517,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.0,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = -0.175,
		MonetaryValue   = 50000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "PARADISE",
		-- Physical
		Mass               = 2500,
		InitialDragCoeff   = 2.32,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.12, -0.142 },
		InertiaMultiplier  = { 1,   1.13,    1.51 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.194,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 149,
		SteeringLock                   = 36.0,

		-- Brake
		BrakeForce     = 0.481,
		BrakeBiasFront = 0.5244,
		HandBrakeForce = 0.65,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.82,
		TractionCurveLateral	 = 14.8,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4847,
		TractionLossMult         = 1.08,

		-- Suspension
		SuspensionForce       = 1.52,
		SuspensionCompDamp    = 1.52,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.123,
		SuspensionLowerLimit  = -0.148,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.459,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.6,
		RollCentreHeightRear  = 0.6,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 22000,
		ModelFlags		= '444011',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "RUMPO",
		-- Physical
		Mass               = 2600,
		InitialDragCoeff   = 2.31,
		DownforceModifier  = 1.14,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.12, -0.14 },
		InertiaMultiplier  = { 1, 1.13,    1.44 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.133,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 159,
		SteeringLock                   = 36.0,

		-- Brake
		BrakeForce     = 0.481,
		BrakeBiasFront = 0.5244,
		HandBrakeForce = 0.65,

		-- Traction
		TractionCurveMax         = 1.91,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 14.8,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4847,
		TractionLossMult         = 1.1,

		-- Suspension
		SuspensionForce       = 1.54,
		SuspensionCompDamp    = 1.56,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.12,
		SuspensionLowerLimit  = -0.146,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.468,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.6,
		RollCentreHeightRear  = 0.7,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 22000,
		ModelFlags		= '444011',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "SLAMVAN",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.93,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.215, -0.251 },
		InertiaMultiplier  = { 0.88, 0.91,    0.92 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.246,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.15,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 148,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.468,
		BrakeBiasFront = 0.6732,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 1.97,
		TractionCurveMin         = 1.79,
		TractionCurveLateral	 = 14.9,
		TractionSpringDeltaMax   = 0.11,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4828,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 1.56,
		SuspensionCompDamp    = 1.85,
		SuspensionReboundDamp = 0.34,
		SuspensionUpperLimit  = 0.215,
		SuspensionLowerLimit  = -0.22,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.616,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.45,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = -0.3,
		MonetaryValue   = 25000,
		ModelFlags		= '220040',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "SLAMVAN2",
		-- Physical
		Mass               = 1950,
		InitialDragCoeff   = 2.73,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.2001, -0.211 },
		InertiaMultiplier  = { 0.89, 0.02,    0.93 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.249,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.15,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 143,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.468,
		BrakeBiasFront = 0.6736,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 2.28,
		TractionCurveMin         = 1.979,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.129,
		LowSpeedTractionLossMult = 1.02,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4833,
		TractionLossMult         = 1.21,

		-- Suspension
		SuspensionForce       = 1.52,
		SuspensionCompDamp    = 1.85,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.21,
		SuspensionLowerLimit  = -0.215,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.631,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.45,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = -0.2,
		MonetaryValue   = 25000,
		ModelFlags		= '220040',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "SLAMVAN3",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.0,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.0, -0.15 },
		InertiaMultiplier  = { 1, 1,    1 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.25,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 135,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.6,
		BrakeBiasFront = 0.7,
		HandBrakeForce = 0.3,

		-- Traction
		TractionCurveMax         = 2.35,
		TractionCurveMin         = 1.77,
		TractionCurveLateral	 = 20.5,
		TractionSpringDeltaMax   = 0.18,
		LowSpeedTractionLossMult = 0.9,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.48,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 2.0,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 2.3,
		SuspensionUpperLimit  = 0.05,
		SuspensionLowerLimit  = -0.2,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.8,
		AntiRollBarBiasFront  = 0.4,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.05,
		SeatOffsetDistZ = -0.275,
		MonetaryValue   = 25000,
		ModelFlags		= '80240040',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "RUMPO3",
		-- Physical
		Mass               = 2250,
		InitialDragCoeff   = 2.0,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, -0.275 },
		InertiaMultiplier  = { 1.3, 1.6,    1.3 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.199,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 36.0,

		-- Brake
		BrakeForce     = 0.5,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.4,

		-- Traction
		TractionCurveMax         = 2.0,
		TractionCurveMin         = 1.7,
		TractionCurveLateral	 = 18.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 0.75,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.48,
		TractionLossMult         = 0.1,

		-- Suspension
		SuspensionForce       = 1.2,
		SuspensionCompDamp    = 0.7,
		SuspensionReboundDamp = 1.2,
		SuspensionUpperLimit  = 0.1,
		SuspensionLowerLimit  = -0.21,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.5,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.6,
		RollCentreHeightRear  = 0.6,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = -0.3,
		MonetaryValue   = 50000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "SURFER",
		-- Physical
		Mass               = 1350,
		InitialDragCoeff   = 2.95,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0, -0.16 },
		InertiaMultiplier  = { 0.96, 0.96,     1.44 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.1985,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 128,
		SteeringLock                   = 30.0,

		-- Brake
		BrakeForce     = 0.447,
		BrakeBiasFront = 0.552,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 1.97,
		TractionCurveMin         = 1.80,
		TractionCurveLateral     = 15.5,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 0.0,
		CamberStiffnesss         = 0.0,
		TractionBiasFront        = 0.4801,
		TractionLossMult         = 1.16,

		-- Suspension
		SuspensionForce       = 1.68,
		SuspensionCompDamp    = 2.1,
		SuspensionReboundDamp = 0.29,
		SuspensionUpperLimit  = 0.099,
		SuspensionLowerLimit  = -0.11,
		SuspensionRaise       = 0.04,
		SuspensionBiasFront   = 0.499,
		AntiRollBarForce      = 0.0,
		AntiRollBarBiasFront  = 0.63,
		RollCentreHeightFront = 0.42,
		RollCentreHeightRear  = 0.38,

		-- Damage
		CollisionDamageMult   = 1.0,
		WeaponDamageMult	  = 1.0,
		DeformationDamageMult = 0.8,
		EngineDamageMult	  = 1.5,
		PetrolTankVolume	  = 60.0,
		OilVolume			  = 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 22000,
		ModelFlags      = "4080",
		HandlingFlags   = "0",
		DamageFlags     = "0",
		AIHandling      = "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "YOUGA",
		-- Physical
		Mass               = 2500,
		InitialDragCoeff   = 2.87,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0.1, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.65 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.1925,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 131,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.485,
		BrakeBiasFront = 0.5298,
		HandBrakeForce = 0.65,

		-- Traction
		TractionCurveMax         = 1.89,
		TractionCurveMin         = 1.72,
		TractionCurveLateral	 = 14.5,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4778,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 1.58,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.182,
		SuspensionLowerLimit  = -0.158,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.54,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.28,
		RollCentreHeightRear  = 0.28,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 22000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
}