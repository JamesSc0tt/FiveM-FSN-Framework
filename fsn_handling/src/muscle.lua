-- Muscle Cars
return {
	CHandlingData {

		HandlingName = "BLADE",
		-- Physical
		Mass               = 1400, 
		InitialDragCoeff   = 2.65,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.240, 0.192 },
		InertiaMultiplier  = { 1.15, 1,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.259,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.25,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 128,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.495,
		BrakeBiasFront = 0.5951,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.08,
		TractionCurveMin         = 1.86,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.10,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4779,
		TractionLossMult         = 1.22,

		-- Suspension
		SuspensionForce       = 1.77,
		SuspensionCompDamp    = 1.70,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.175,
		SuspensionLowerLimit  = -0.145,
		SuspensionRaise		  = -0.029,
		SuspensionBiasFront   = 0.491,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.48,
		RollCentreHeightRear  = 0.405,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 12000,
		ModelFlags		= '440010',
		HandlingFlags   = "1",
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

		HandlingName = "BUCCANEER",  -- Might be wrong name BUCCANEE
		-- Physical
		Mass               = 1900, 
		InitialDragCoeff   = 2.35,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.175, -0.061 },
		InertiaMultiplier  = { 1.15, 1,    1.55 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.289,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 147,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.49,
		BrakeBiasFront = 0.5731,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4829,
		TractionLossMult         = 1.25,

		-- Suspension
		SuspensionForce       = 1.85,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.162,
		SuspensionLowerLimit  = -0.154,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.631,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
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

		HandlingName = "CHINO",
		-- Physical
		Mass               = 2300,
		InitialDragCoeff   = 2.28,
		DownforceModifier  = 1.09,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.22, -0.04 },
		InertiaMultiplier  = { 1, 1.06,    1.7 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.234,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.9,
		InitialDriveMaxFlatVel         = 126,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.47,
		BrakeBiasFront = 0.562,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.73,
		TractionCurveLateral	 = 14.6,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.481,
		TractionLossMult         = 1.25,

		-- Suspension
		SuspensionForce       = 1.45,
		SuspensionCompDamp    = 1.65,
		SuspensionReboundDamp = 0.31,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.17,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.460,
		AntiRollBarBiasFront  = 0.66,
		RollCentreHeightFront = 0.2,
		RollCentreHeightRear  = 0.2,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.5,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {

		HandlingName = "DEVIANT",
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 2.0,
		DownforceModifier  = 1.0,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.1, 0 },
		InertiaMultiplier  = { 1, 1.2,    1.35 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.29,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.4,
		ClutchChangeRateScaleDownShift = 2.4,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.47,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.25,
		TractionCurveMin         = 2.1,
		TractionCurveLateral	 = 22.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1.4,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.5,
		TractionLossMult         = 1,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 2.3,
		SuspensionUpperLimit  = 0.08,
		SuspensionLowerLimit  = -0.14,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.51,
		AntiRollBarBiasFront  = 0.4,
		RollCentreHeightFront = 0.575,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.3,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
			}
		}
	},
	CHandlingData {

		HandlingName = "DOMINATOR",
		-- Physical
		Mass               = 1650,
		InitialDragCoeff   = 2.50,
		DownforceModifier  = 1.48,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.181, -0.097 },
		InertiaMultiplier  = { 1.15, 1,    1.38 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.29,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.0,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 140,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.54,
		BrakeBiasFront = 0.649,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.74,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4804,
		TractionLossMult         = 1.19,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 1.1,
		SuspensionReboundDamp = 3.0,
		SuspensionUpperLimit  = 0.09,
		SuspensionLowerLimit  = -0.1,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarBiasFront  = 0.3,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
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

		HandlingName = "DOMINATOR2",
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 2.5,
		DownforceModifier  = 1.45,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.189, -0.118 },
		InertiaMultiplier  = { 0.96, 0.99,    1.45 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.335,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.0,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 34.1,

		-- Brake
		BrakeForce     = 0.278,
		BrakeBiasFront = 0.635,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.49,
		TractionCurveMin         = 1.27,
		TractionCurveLateral	 = 14.2,
		TractionSpringDeltaMax   = 0.09,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4824,
		TractionLossMult         = 1.21,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 1.1,
		SuspensionReboundDamp = 3.0,
		SuspensionUpperLimit  = 0.09,
		SuspensionLowerLimit  = -0.1,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarBiasFront  = 0.3,
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
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.06,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
		CHandlingData {

		HandlingName = "DOMINATOR3",
		-- Physical
		Mass               = 1670,
		InitialDragCoeff   = 2.9,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, -0.15 },
		InertiaMultiplier  = { 1, 1,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.375,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 158,
		SteeringLock                   = 28.4,

		-- Brake
		BrakeForce     = 0.982,
		BrakeBiasFront = 0.635,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.57,
		TractionCurveMin         = 2.35,
		TractionCurveLateral	 = 14.2,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1.05,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4824,
		TractionLossMult         = 1.21,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 1.1,
		SuspensionReboundDamp = 0.48,
		SuspensionUpperLimit  = 0.091,
		SuspensionLowerLimit  = -0.133,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.55,
		AntiRollBarBiasFront  = 0.3,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.06,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {

		HandlingName = "DUKES",
		-- Physical
		Mass               = 1750,
		InitialDragCoeff   = 2.97,
		DownforceModifier  = 1.15,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.19, -0.078 },
		InertiaMultiplier  = { 1.15, 1,    1.27 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.299,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.25,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 162,
		SteeringLock                   = 34.6,

		-- Brake
		BrakeForce     = 0.501,
		BrakeBiasFront = 0.618,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.095,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.480,
		TractionLossMult         = 1.18,

		-- Suspension
		SuspensionForce       = 1.95,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.185,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.656,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.3,
		RollCentreHeightRear  = 0.29,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 1.2,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.125,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {

		HandlingName = "ELLIE",
		-- Physical
		Mass               = 1370,
		InitialDragCoeff   = 2.89,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.1, -0.25 },
		InertiaMultiplier  = { 1, 1,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0.49,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.296,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 183,
		SteeringLock                   = 29.3,

		-- Brake
		BrakeForce     = 0.780,
		BrakeBiasFront = 0.55,
		HandBrakeForce = 1.00,

		-- Traction
		TractionCurveMax         = 2.002,
		TractionCurveMin         = 1.901,
		TractionCurveLateral	 = 22.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1.63,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.5,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 1.25,
		SuspensionCompDamp    = 1.1,
		SuspensionReboundDamp = 3.0,
		SuspensionUpperLimit  = 0.09,
		SuspensionLowerLimit  = -0.1,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.51,
		AntiRollBarForce	  = 0.7,
		AntiRollBarBiasFront  = 0.3,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.023,
		SeatOffsetDistY = -0.155,
		SeatOffsetDistZ = -0.04,
		MonetaryValue   = 100000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000001",
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

		HandlingName = "GAUNTLET",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 2.88,
		DownforceModifier  = 1.24,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.219, -0.112 },
		InertiaMultiplier  = { 1.15, 0.99,    1.67 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.273,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 155,
		SteeringLock                   = 33.8,

		-- Brake
		BrakeForce     = 0.535,
		BrakeBiasFront = 0.586,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.16,
		TractionCurveMin         = 1.92,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4769,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 2.25,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.129,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.619,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.32,
		RollCentreHeightRear  = 0.33,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.15,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
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

		HandlingName = "GAUNTLET2",
		-- Physical
		Mass               = 1650,
		InitialDragCoeff   = 2.36,
		DownforceModifier  = 1.41,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.231, -0.099 },
		InertiaMultiplier  = { 0.96, 0.99,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.301,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 167,
		SteeringLock                   = 34.1,

		-- Brake
		BrakeForce     = 0.57,
		BrakeBiasFront = 0.62,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.19,
		TractionCurveMin         = 1.97,
		TractionCurveLateral	 = 14.3,
		TractionSpringDeltaMax   = 0.09,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4802,
		TractionLossMult         = 1.23,

		-- Suspension
		SuspensionForce       = 3.41,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.42,
		SuspensionUpperLimit  = 0.121,
		SuspensionLowerLimit  = -0.131,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.572,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.0,
		RollCentreHeightRear  = 0.0,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.15,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
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

		HandlingName = "HOTKNIFE",
		-- Physical
		Mass               = 1300,
		InitialDragCoeff   = 3.16,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.21, -0.131 },
		InertiaMultiplier  = { 0.91, 0.9,    1.33 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.305,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 162,
		SteeringLock                   = 33.8,

		-- Brake
		BrakeForce     = 0.198,
		BrakeBiasFront = 0.52,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.42,
		TractionCurveMin         = 1.19,
		TractionCurveLateral	 = 14.6,
		TractionSpringDeltaMax   = 0.09,
		LowSpeedTractionLossMult = 0.01,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4821,
		TractionLossMult         = 0.8,

		-- Suspension
		SuspensionForce       = 1.94,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.103,
		SuspensionLowerLimit  = -0.08,
		SuspensionRaise		  = 0.017,
		SuspensionBiasFront   = 0.536,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.536,
		RollCentreHeightFront = 0.05,
		RollCentreHeightRear  = 0.05,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.4,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
		ModelFlags		= '110040',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.05,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {

		HandlingName = "FACTION",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.95,
		DownforceModifier  = 1.15,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.08, -0.065 },
		InertiaMultiplier  = { 1.15, 1,    1.3 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.274,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.511,
		BrakeBiasFront = 0.609,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.87,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.12,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4769,
		TractionLossMult         = 1.25,

		-- Suspension
		SuspensionForce       = 2.12,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.55,
		SuspensionUpperLimit  = 0.061,
		SuspensionLowerLimit  = -0.125,
		SuspensionRaise		  = 0.015,
		SuspensionBiasFront   = 0.572,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.56,
		RollCentreHeightFront = 0.2,
		RollCentreHeightRear  = 0.2,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.05,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '80d40010',
		HandlingFlags   = "20000000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {

		HandlingName = "NITESHAD", -- Missing handling
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 2.36,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, -0.095 },
		InertiaMultiplier  = { 1.15, 1,    1.58 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.305,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 155,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.59,
		BrakeBiasFront = 0.62,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.89,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.0,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4809,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 2.08,
		SuspensionCompDamp    = 1.3,
		SuspensionReboundDamp = 1.7,
		SuspensionUpperLimit  = 0.05,
		SuspensionLowerLimit  = -0.15,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.46,
		AntiRollBarForce	  = 0.3,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.12,
		RollCentreHeightRear  = 0.11,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.15,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 130000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.055,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25
			}
		}
	},
	CHandlingData {

		HandlingName = "PICADOR",
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 2.91,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.218, -0.164 },
		InertiaMultiplier  = { 0.94, 0.96,    0.91 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.31,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 162,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.582,
		BrakeBiasFront = 0.599,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.85,
		TractionCurveLateral	 = 14.3,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4804,
		TractionLossMult         = 1.14,

		-- Suspension
		SuspensionForce       = 1.61,
		SuspensionCompDamp    = 1.8,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.175,
		SuspensionLowerLimit  = -0.168,
		SuspensionRaise		  = 0.045,
		SuspensionBiasFront   = 0.52,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.4,
		RollCentreHeightRear  = 0.4,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "4000",
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

		HandlingName = "RATLOADER2", -- Missing handling
		-- Physical
		Mass               = 1650,
		InitialDragCoeff   = 2.36,
		DownforceModifier  = 1.41,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.231, -0.099 },
		InertiaMultiplier  = { 0.96, 0.99,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.301,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 167,
		SteeringLock                   = 34.1,

		-- Brake
		BrakeForce     = 0.57,
		BrakeBiasFront = 0.62,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.19,
		TractionCurveMin         = 1.97,
		TractionCurveLateral	 = 14.3,
		TractionSpringDeltaMax   = 0.09,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4802,
		TractionLossMult         = 1.23,

		-- Suspension
		SuspensionForce       = 3.41,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.42,
		SuspensionUpperLimit  = 0.121,
		SuspensionLowerLimit  = -0.131,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.572,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.0,
		RollCentreHeightFront = 0.0,
		RollCentreHeightRear  = 0.0,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.4,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.15,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '440010',
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

		HandlingName = "RUINER",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 2.75,
		DownforceModifier  = 1.22,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0, 0.04 },
		InertiaMultiplier  = { 1.18, 1,    1.42 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.281,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 187,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.543,
		BrakeBiasFront = 0.506,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.805,
		TractionCurveLateral	 = 17.5,
		TractionSpringDeltaMax   = 0.143,
		LowSpeedTractionLossMult = 1.16,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4825,
		TractionLossMult         = 1.22,

		-- Suspension
		SuspensionForce       = 2.25,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 0.38,
		SuspensionUpperLimit  = 0.105,
		SuspensionLowerLimit  = -0.145,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.504,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.615,
		RollCentreHeightRear  = 0.606,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 110000,
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

		HandlingName = "SABREGT",
		-- Physical
		Mass               = 1850,
		InitialDragCoeff   = 2.01,
		DownforceModifier  = 1.17,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0.221, 0.013 },
		InertiaMultiplier  = { 1.19, 1,    1.42 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.27,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 168,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.524,
		BrakeBiasFront = 0.615,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.81,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4775,
		TractionLossMult         = 1.12,

		-- Suspension
		SuspensionForce       = 1.99,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 0.37,
		SuspensionUpperLimit  = 0.137,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.628,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.56,
		RollCentreHeightFront = 0.31,
		RollCentreHeightRear  = 0.31,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {

		HandlingName = "TULIP",
		-- Physical
		Mass               = 1850,
		InitialDragCoeff   = 2.01,
		DownforceModifier  = 1.17,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0.221, 0.013 },
		InertiaMultiplier  = { 1.19, 1,    1.42 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 7,
		InitialDriveForce              = 0.298,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 157,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.524,
		BrakeBiasFront = 0.615,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.97,
		TractionCurveMin         = 1.81,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4775,
		TractionLossMult         = 1.22,

		-- Suspension
		SuspensionForce       = 1.99,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 0.37,
		SuspensionUpperLimit  = 0.137,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.628,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.56,
		RollCentreHeightFront = 0.31,
		RollCentreHeightRear  = 0.31,

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
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {

		HandlingName = "TAMPA",
		-- Physical
		Mass               = 1700,
		InitialDragCoeff   = 1.98,
		DownforceModifier  = 1.15,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0, 0.067 },
		InertiaMultiplier  = { 1.15, 1,    1.55 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.225,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.2,
		InitialDriveMaxFlatVel         = 148,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.227,
		BrakeBiasFront = 0.503,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.32,
		TractionCurveMin         = 1.1,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 0.33,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4809,
		TractionLossMult         = 1.1,

		-- Suspension
		SuspensionForce       = 2.12,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.33,
		SuspensionUpperLimit  = 0.125,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.52,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.575,
		RollCentreHeightFront = 0.207,
		RollCentreHeightRear  = 0.2,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {

		HandlingName = "VIRGO",
		-- Physical
		Mass               = 2300,
		InitialDragCoeff   = 2.7,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.075, 0.071 },
		InertiaMultiplier  = { 0.99, 1.05,    1.62 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.269,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.25,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 156,
		SteeringLock                   = 34.8,

		-- Brake
		BrakeForce     = 0.483,
		BrakeBiasFront = 0.463,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.03,
		TractionCurveMin         = 1.95,
		TractionCurveLateral	 = 14.9,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4805,
		TractionLossMult         = 1.15,

		-- Suspension
		SuspensionForce       = 1.56,
		SuspensionCompDamp    = 1.65,
		SuspensionReboundDamp = 0.31,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.014,
		SuspensionBiasFront   = 0.392,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.63,
		RollCentreHeightFront = 0.2,
		RollCentreHeightRear  = 0.2,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.15,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {

		HandlingName = "VIGERO",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.41,
		DownforceModifier  = 1.15,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.16, -0.102 },
		InertiaMultiplier  = { 1.15, 1,    1.51 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.272,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.25,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 162,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.502,
		BrakeBiasFront = 0.638,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.8,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.481,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 1.91,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 0.34,
		SuspensionUpperLimit  = 0.158,
		SuspensionLowerLimit  = -0.144,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.538,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.4,
		RollCentreHeightRear  = 0.33,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.05,
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

		HandlingName = "YOSEMITE",
		-- Physical
		Mass               = 1300,
		InitialDragCoeff   = 2.25,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, 0.15 },
		InertiaMultiplier  = { 1, 1,    1 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.355,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 187,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.55,
		BrakeBiasFront = 0.5,
		HandBrakeForce = 0.25,

		-- Traction
		TractionCurveMax         = 1.775,
		TractionCurveMin         = 1.6,
		TractionCurveLateral	 = 20.5,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.1,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.495,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 2.5,
		SuspensionCompDamp    = 1.8,
		SuspensionReboundDamp = 4.3,
		SuspensionUpperLimit  = 0.1,
		SuspensionLowerLimit  = -0.12,
		SuspensionRaise		  = 0.15,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.8,
		AntiRollBarBiasFront  = 0.3,
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
		SeatOffsetDistY = -0.05,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '80440040',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
}