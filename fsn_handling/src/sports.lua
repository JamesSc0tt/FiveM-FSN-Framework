-- Sports Cars
return {
	CHandlingData {
		HandlingName = "ALPHA",
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.152,
		DownforceModifier  = 1.27,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.171, 0.01 },
		InertiaMultiplier  = { 1.17, 1,    1.64 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.293,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 141,
		SteeringLock                   = 33.8,

		-- Brake
		BrakeForce     = 0.475,
		BrakeBiasFront = 0.478,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2,
		TractionCurveMin         = 1.93,
		TractionCurveLateral	 = 16.4,
		TractionSpringDeltaMax   = 0.139,
		LowSpeedTractionLossMult = 1.13,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4846,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 2.89,
		SuspensionCompDamp    = 1.28,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.122,
		SuspensionLowerLimit  = -0.129,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.469,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.489,
		RollCentreHeightRear  = 0.485,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.05,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 80000,
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
		
		HandlingName = "BESTIAGTS",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 2.37,
		DownforceModifier  = 1.47,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.135, 0.04 },
		InertiaMultiplier  = { 1.201, 1,    1.46 },

		-- Transmission
		DriveBiasFront                 = 0.09,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.334,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 7.6,
		ClutchChangeRateScaleDownShift = 6,
		InitialDriveMaxFlatVel         = 133,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 0.508,
		BrakeBiasFront = 0.433,
		HandBrakeForce = 0.82,

		-- Traction
		TractionCurveMax         = 1.99,
		TractionCurveMin         = 1.86,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.136,
		LowSpeedTractionLossMult = 1.09,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4856,
		TractionLossMult         = 1.22,

		-- Suspension
		SuspensionForce       = 3.02,
		SuspensionCompDamp    = 1.28,
		SuspensionReboundDamp = 0.57,
		SuspensionUpperLimit  = 0.114,
		SuspensionLowerLimit  = -0.154,
		SuspensionRaise		  = -0.011,
		SuspensionBiasFront   = 0.463,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.172,
		RollCentreHeightRear  = 0.171,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.025,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0,
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
		
		HandlingName = "BUFFALO",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 2.93,
		DownforceModifier  = 1.38,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.03, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.56 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.283,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.555,
		BrakeBiasFront = 0.521,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 2.051,
		TractionCurveMin         = 1.954,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4861,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 2.74,
		SuspensionCompDamp    = 1.29,
		SuspensionReboundDamp = 0.47,
		SuspensionUpperLimit  = 0.094,
		SuspensionLowerLimit  = -0.125,
		SuspensionRaise		  = 0.008,
		SuspensionBiasFront   = 0.515,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.407,
		RollCentreHeightRear  = 0.405,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 55000,
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
		
		HandlingName = "BUFFALO2",
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.88,
		DownforceModifier  = 1.41,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.03, 0.03 },
		InertiaMultiplier  = { 1.17, 1,    1.55 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.321,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 177,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.565,
		BrakeBiasFront = 0.520,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.22,
		TractionCurveMin         = 2.074,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.137,
		LowSpeedTractionLossMult = 1.14,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4858,
		TractionLossMult         = 1.21,

		-- Suspension
		SuspensionForce       = 2.86,
		SuspensionCompDamp    = 1.28,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.092,
		SuspensionLowerLimit  = -0.129,
		SuspensionRaise		  = 0.004,
		SuspensionBiasFront   = 0.513,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.417,
		RollCentreHeightRear  = 0.409,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 75000,
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
		
		HandlingName = "CARBONIZ", -- No Handling
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.50,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.2, 0 },
		InertiaMultiplier  = { 1.2, 1.4,    1.4 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.35,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.5,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 155,
		SteeringLock                   = 40.0,

		-- Brake
		BrakeForce     = 0.84,
		BrakeBiasFront = 0.649,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.38,
		TractionCurveMin         = 2.2,
		TractionCurveLateral	 = 22.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 0.6,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.48,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 2.0,
		SuspensionCompDamp    = 1.1,
		SuspensionReboundDamp = 2.0,
		SuspensionUpperLimit  = 0.13,
		SuspensionLowerLimit  = -0.1,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.58,
		AntiRollBarBiasFront  = 0.62,
		RollCentreHeightFront = 0.33,
		RollCentreHeightRear  = 0.3,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 100000,
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
		
		HandlingName = "COMET",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.21,
		DownforceModifier  = 1.61,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.17, 0.01 },
		InertiaMultiplier  = { 1.16, 1,    1.78 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.31,
		DriveInertia                   = 1.04,
		ClutchChangeRateScaleUpShift   = 2.3,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 148,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.578,
		BrakeBiasFront = 0.457,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.04,
		TractionCurveMin         = 1.953,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.22,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4857,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.6,
		SuspensionCompDamp    = 1.2,
		SuspensionReboundDamp = 2.8,
		SuspensionUpperLimit  = 0.09,
		SuspensionLowerLimit  = -0.1,
		SuspensionRaise		  = 0.05,
		SuspensionBiasFront   = 0.47,
		AntiRollBarBiasFront  = 0.9,
		AntiRollBarBiasFront  = 0.68,
		RollCentreHeightFront = 0.35,
		RollCentreHeightRear  = 0.4,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
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
		
		HandlingName = "COMET3",
		-- Physical
		Mass               = 1200,
		InitialDragCoeff   = 2.18,
		DownforceModifier  = 1.61,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.13, 0.025 },
		InertiaMultiplier  = { 1.2, 1.5,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.34,
		DriveInertia                   = 1.05,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.35,
		InitialDriveMaxFlatVel         = 152,
		SteeringLock                   = 33.7,

		-- Brake
		BrakeForce     = 0.826,
		BrakeBiasFront = 0.406,
		HandBrakeForce = 0.85,

		-- Traction
		TractionCurveMax         = 2.20,
		TractionCurveMin         = 1.987,
		TractionCurveLateral	 = 16.55,
		TractionSpringDeltaMax   = 0.136,
		LowSpeedTractionLossMult = 0.8,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.48345,
		TractionLossMult         = 1.19,

		-- Suspension
		SuspensionForce       = 3.11,
		SuspensionCompDamp    = 1.36,
		SuspensionReboundDamp = 0.67,
		SuspensionUpperLimit  = 0.0525,
		SuspensionLowerLimit  = -0.137,
		SuspensionRaise		  = 0.0165,
		SuspensionBiasFront   = 0.452,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.68,
		RollCentreHeightFront = 0.282,
		RollCentreHeightRear  = 0.266,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
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
		
		HandlingName = "COMET5",
		-- Physical
		Mass               = 1200,
		InitialDragCoeff   = 2.801,
		DownforceModifier  = 1.78,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.13, 0.025 },
		InertiaMultiplier  = { 1.16, 1,    1.47 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.447,
		DriveInertia                   = 1.05,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.35,
		InitialDriveMaxFlatVel         = 170,
		SteeringLock                   = 32.7,

		-- Brake
		BrakeForce     = 0.640,
		BrakeBiasFront = 0.406,
		HandBrakeForce = 0.55,

		-- Traction
		TractionCurveMax         = 2.11,
		TractionCurveMin         = 1.944,
		TractionCurveLateral	 = 16.55,
		TractionSpringDeltaMax   = 0.136,
		LowSpeedTractionLossMult = 0.8,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.48345,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 3.11,
		SuspensionCompDamp    = 1.36,
		SuspensionReboundDamp = 0.67,
		SuspensionUpperLimit  = 0.0525,
		SuspensionLowerLimit  = -0.137,
		SuspensionRaise		  = 0.0165,
		SuspensionBiasFront   = 0.452,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.68,
		RollCentreHeightFront = 0.282,
		RollCentreHeightRear  = 0.266,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
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
		
		HandlingName = "COQUETTE",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.05,
		DownforceModifier  = 1.57,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.136, 0.02 },
		InertiaMultiplier  = { 1.15, 0.99,    2.45 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.339,
		DriveInertia                   = 1.01,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33.5,

		-- Brake
		BrakeForce     = 0.532,
		BrakeBiasFront = 0.467,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.04,
		TractionCurveMin         = 1.958,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.128,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4848,
		TractionLossMult         = 1.11,

		-- Suspension
		SuspensionForce       = 2.99,
		SuspensionCompDamp    = 1.27,
		SuspensionReboundDamp = 0.57,
		SuspensionUpperLimit  = 0.078,
		SuspensionLowerLimit  = -0.129,
		SuspensionRaise		  = -0.014,
		SuspensionBiasFront   = 0.491,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.173,
		RollCentreHeightRear  = 0.171,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
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
		
		HandlingName = "TAMPA2",
		-- Physical
		Mass               = 1200,
		InitialDragCoeff   = 2.28,
		DownforceModifier  = 1.48,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.13, 0.02 },
		InertiaMultiplier  = { 1.13, 1.02,    1.71 },

		-- Transmission
		DriveBiasFront                 = 0.193,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.421,
		DriveInertia                   = 0.95,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 37,

		-- Brake
		BrakeForce     = 0.309,
		BrakeBiasFront = 0.472,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.37,
		TractionCurveMin         = 1.126,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.145,
		LowSpeedTractionLossMult = 0.24,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4911,
		TractionLossMult         = 1.17,

		-- Suspension
		SuspensionForce       = 2.71,
		SuspensionCompDamp    = 1.32,
		SuspensionReboundDamp = 0.68,
		SuspensionUpperLimit  = 0.086,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = 0.058,
		SuspensionBiasFront   = 0.488,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.575,
		RollCentreHeightFront = 0.213,
		RollCentreHeightRear  = 0.238,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.12,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ELEGY",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 2.19,
		DownforceModifier  = 1.43,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.095, 0.038 },
		InertiaMultiplier  = { 1.16, 1,    1.46 },

		-- Transmission
		DriveBiasFront                 = 0.468,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.23,
		DriveInertia                   = 1.04,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 185,
		SteeringLock                   = 35.2,

		-- Brake
		BrakeForce     = 0.780,
		BrakeBiasFront = 0.478,
		HandBrakeForce = 1.05,

		-- Traction
		TractionCurveMax         = 2.51,
		TractionCurveMin         = 1.802,
		TractionCurveLateral	 = 17.0,
		TractionSpringDeltaMax   = 0.141,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4865,
		TractionLossMult         = 1.08,

		-- Suspension
		SuspensionForce       = 3.02,
		SuspensionCompDamp    = 1.37,
		SuspensionReboundDamp = 0.62,
		SuspensionUpperLimit  = 0.068,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise		  = 0.004,
		SuspensionBiasFront   = 0.439,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.25,
		RollCentreHeightFront = 0.256,
		RollCentreHeightRear  = 0.253,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 100000,
		ModelFlags		= '440010',
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
		
		HandlingName = "ELEGY2",
		-- Physical
		Mass               = 1700,
		InitialDragCoeff   = 1.92,
		DownforceModifier  = 1.39,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.132, 0.017 },
		InertiaMultiplier  = { 1.15, 1,    1.68 },

		-- Transmission
		DriveBiasFront                 = 0.156,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.312,
		DriveInertia                   = 1.02,
		ClutchChangeRateScaleUpShift   = 2.7,
		ClutchChangeRateScaleDownShift = 2.6,
		InitialDriveMaxFlatVel         = 185,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.830,
		BrakeBiasFront = 0.461,
		HandBrakeForce = 1.1,

		-- Traction
		TractionCurveMax         = 2.82,
		TractionCurveMin         = 2.4,
		TractionCurveLateral	 = 16.4,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 1.37,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.5,
		TractionLossMult         = 1.03,

		-- Suspension
		SuspensionForce       = 3.03,
		SuspensionCompDamp    = 1.27,
		SuspensionReboundDamp = 0.595,
		SuspensionUpperLimit  = 0.083,
		SuspensionLowerLimit  = -0.129,
		SuspensionRaise		  = -0.009,
		SuspensionBiasFront   = 0.485,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.,
		RollCentreHeightFront = 0.219,
		RollCentreHeightRear  = 0.217,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 0.7,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 100000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.05,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "FELTZER",
		-- Physical
		Mass               = 1450,
		InitialDragCoeff   = 2.85,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0, 0 },
		InertiaMultiplier  = { 1, 1.13,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.40,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 2.0,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 168,
		SteeringLock                   = 32.6,

		-- Brake
		BrakeForce     = 0.498,
		BrakeBiasFront = 0.453,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 1.99,
		TractionCurveMin         = 1.84,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.142,
		LowSpeedTractionLossMult = 1.07,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.482,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 3.01,
		SuspensionCompDamp    = 1.23,
		SuspensionReboundDamp = 0.57,
		SuspensionUpperLimit  = 0.082,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = 0.022,
		SuspensionBiasFront   = 0.452,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.547,
		RollCentreHeightRear  = 0.545,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 30000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000",
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
		
		HandlingName = "FLASHGT",
		-- Physical
		Mass               = 1300,
		InitialDragCoeff   = 3.45,
		DownforceModifier  = 1.51,
		PercentSubmerged   = 70,
		CentreOfMassOffset = { 0,    -0.03, -0.42 },
		InertiaMultiplier  = { 1.22, 1,    1.49 },

		-- Transmission
		DriveBiasFront                 = 0.35,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.351,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 149,
		SteeringLock                   = 34,

		-- Brake
		BrakeForce     = 0.481,
		BrakeBiasFront = 0.469,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 2.45,
		TractionCurveMin         = 2.15,
		TractionCurveLateral	 = 20.0,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.5125,
		TractionLossMult         = 0.35,

		-- Suspension
		SuspensionForce       = 1.6,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 3.5,
		SuspensionUpperLimit  = 0.09,
		SuspensionLowerLimit  = -0.1,
		SuspensionRaise		  = 0.03,
		SuspensionBiasFront   = 0.502,
		AntiRollBarForce	  = 0.75,
		AntiRollBarBiasFront  = 0.1,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.0,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.45,
		SeatOffsetDistZ = -0.05,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "82000A",
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
		
		HandlingName = "FUROREGT",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 2.72,
		DownforceModifier  = 1.39,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.115, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.83 },

		-- Transmission
		DriveBiasFront                 = 0.155,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.282,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2,
		InitialDriveMaxFlatVel         = 170,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.485,
		BrakeBiasFront = 0.477,
		HandBrakeForce = 0.85,

		-- Traction
		TractionCurveMax         = 2.13,
		TractionCurveMin         = 1.94,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4816,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.82,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.515,
		SuspensionUpperLimit  = 0.103,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = -0.011,
		SuspensionBiasFront   = 0.468,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.276,
		RollCentreHeightRear  = 0.275,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
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
		
		HandlingName = "FUSILADE",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 2.501,
		DownforceModifier  = 1.32,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.095, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.81 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.262,
		DriveInertia                   = 1.01,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 146,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.468,
		BrakeBiasFront = 0.450,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.08,
		TractionCurveMin         = 1.899,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.03,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4809,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.71,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.104,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = -0.005,
		SuspensionBiasFront   = 0.483,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.175,
		RollCentreHeightRear  = 0.174,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.5,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 35000,
		ModelFlags		= '400010',
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
		
		HandlingName = "ITALIGTO",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.12,
		DownforceModifier  = 2.02,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.131, 0.025 },
		InertiaMultiplier  = { 1.17, 1,    1.87 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.380,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 5.6,
		ClutchChangeRateScaleDownShift = 5.2,
		InitialDriveMaxFlatVel         = 205,
		SteeringLock                   = 32.6,

		-- Brake
		BrakeForce     = 0.514,
		BrakeBiasFront = 0.465,
		HandBrakeForce = 0.13,

		-- Traction
		TractionCurveMax         = 2.21,
		TractionCurveMin         = 1.99,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.02,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4831,
		TractionLossMult         = 1.33,

		-- Suspension
		SuspensionForce       = 3.43,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.66,
		SuspensionUpperLimit  = 0.052,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = 0.013,
		SuspensionBiasFront   = 0.466,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.399,
		RollCentreHeightRear  = 0.348,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "20002",
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
		
		HandlingName = "JESTER",
		-- Physical
		Mass               = 1750,
		InitialDragCoeff   = 3.97,
		DownforceModifier  = 1.78,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.202, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.65 },

		-- Transmission
		DriveBiasFront                 = 0.101,
		InitialDriveGears              = 7,
		InitialDriveForce              = 0.310,
		DriveInertia                   = 0.98,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 2,
		InitialDriveMaxFlatVel         = 173,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.528,
		BrakeBiasFront = 0.439,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.837,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4838,
		TractionLossMult         = 1.32,

		-- Suspension
		SuspensionForce       = 3.23,
		SuspensionCompDamp    = 1.26,
		SuspensionReboundDamp = 0.59,
		SuspensionUpperLimit  = 0.0745,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = 0.012,
		SuspensionBiasFront   = 0.4681,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.1545,
		RollCentreHeightRear  = 0.152,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.15,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 80000,
		ModelFlags		= '440010',
		HandlingFlags   = "20002",
		DamageFlags		= "20",
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
		
		HandlingName = "JESTER2",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 3.54,
		DownforceModifier  = 2.1,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.197, 0.01 },
		InertiaMultiplier  = { 1.14, 0.99,    1.55 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.480,
		DriveInertia                   = 1.25,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 2.4,
		InitialDriveMaxFlatVel         = 225,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.551,
		BrakeBiasFront = 0.427,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.04,
		TractionCurveMin         = 1.943,
		TractionCurveLateral	 = 16.4,
		TractionSpringDeltaMax   = 0.128,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4844,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 3.45,
		SuspensionCompDamp    = 1.24,
		SuspensionReboundDamp = 0.72,
		SuspensionUpperLimit  = 0.068,
		SuspensionLowerLimit  = -0.121,
		SuspensionRaise		  = 0.01,
		SuspensionBiasFront   = 0.464,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.169,
		RollCentreHeightRear  = 0.167,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.15,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 80000,
		ModelFlags		= '440010',
		HandlingFlags   = "20002",
		DamageFlags		= "20",
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
		
		HandlingName = "KURUMA",
		-- Physical
		Mass               = 1650,
		InitialDragCoeff   = 2.87,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.131, -0.183 },
		InertiaMultiplier  = { 1.16, 1,    1.85 },

		-- Transmission
		DriveBiasFront                 = 0.39,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.34,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.0,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 167,
		SteeringLock                   = 34.5,

		-- Brake
		BrakeForce     = 0.965,
		BrakeBiasFront = 0.5,
		HandBrakeForce = 0.85,

		-- Traction
		TractionCurveMax         = 2.13,
		TractionCurveMin         = 2.03,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.141,
		LowSpeedTractionLossMult = 1.18,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4859,
		TractionLossMult         = 1.09,

		-- Suspension
		SuspensionForce       = 2.82,
		SuspensionCompDamp    = 1.41,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.124,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise		  = 0.008,
		SuspensionBiasFront   = 0.484,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.369,
		RollCentreHeightRear  = 0.367,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.025,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 35000,
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
		
		HandlingName = "LYNX",
		-- Physical
		Mass               = 1725,
		InitialDragCoeff   = 2.745,
		DownforceModifier  = 1.54,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,  -0.07, -0.2 },
		InertiaMultiplier  = { 1.2, 1.2,    1.4 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.315,
		DriveInertia                   = 0.98,
		ClutchChangeRateScaleUpShift   = 3.1,
		ClutchChangeRateScaleDownShift = 3.1,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.515,
		BrakeBiasFront = 0.485,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.14,
		TractionCurveMin         = 1.969,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.135,
		LowSpeedTractionLossMult = 1.001,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4851,
		TractionLossMult         = 1.32,

		-- Suspension
		SuspensionForce       = 2.14,
		SuspensionCompDamp    = 1.26,
		SuspensionReboundDamp = 0.555,
		SuspensionUpperLimit  = 0.093,
		SuspensionLowerLimit  = -0.119,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.459,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.279,
		RollCentreHeightRear  = 0.277,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
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
		
		HandlingName = "MASSACRO",
		-- Physical
		Mass               = 1750,
		InitialDragCoeff   = 2.001,
		DownforceModifier  = 1.58,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.131, 0.02 },
		InertiaMultiplier  = { 1.16, 0.98,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 8,
		InitialDriveForce              = 0.258,
		DriveInertia                   = 1.01,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 177,
		SteeringLock                   = 33.3,

		-- Brake
		BrakeForce     = 0.588,
		BrakeBiasFront = 0.489,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 1.984,
		TractionCurveMin         = 1.858,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.132,
		LowSpeedTractionLossMult = 0.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4841,
		TractionLossMult         = 1.38,

		-- Suspension
		SuspensionForce       = 2.81,
		SuspensionCompDamp    = 1.29,
		SuspensionReboundDamp = 0.54,
		SuspensionUpperLimit  = 0.084,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = 0.003,
		SuspensionBiasFront   = 0.484,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.308,
		RollCentreHeightRear  = 0.305,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "20002",
		DamageFlags		= "20",
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
		
		HandlingName = "MASSACRO2",
		-- Physical
		Mass               = 1450,
		InitialDragCoeff   = 2.2,
		DownforceModifier  = 1.67,
		PercentSubmerged   = 70,
		CentreOfMassOffset = { 0,    -0.131, 0.01 },
		InertiaMultiplier  = { 1.14, 0.99,    1.43 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.355,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 2.4,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 197,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.535,
		BrakeBiasFront = 0.476,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.16,
		TractionCurveMin         = 1.9,
		TractionCurveLateral	 = 16.4,
		TractionSpringDeltaMax   = 0.126,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4854,
		TractionLossMult         = 1.34,

		-- Suspension
		SuspensionForce       = 3.34,
		SuspensionCompDamp    = 1.25,
		SuspensionReboundDamp = 0.62,
		SuspensionUpperLimit  = 0.078,
		SuspensionLowerLimit  = -0.128,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.484,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.321,
		RollCentreHeightRear  = 0.7,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "20002",
		DamageFlags		= "20",
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
		
		HandlingName = "NEON",
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 11,
		DownforceModifier  = 1.66,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.125, -0.2 },
		InertiaMultiplier  = { 1, 1.3,    1.2 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 1,
		InitialDriveForce              = 0.2505,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 9,
		ClutchChangeRateScaleDownShift = 9,
		InitialDriveMaxFlatVel         = 156,
		SteeringLock                   = 33.8,

		-- Brake
		BrakeForce     = 0.63,
		BrakeBiasFront = 0.499,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.45,
		TractionCurveMin         = 2.317,
		TractionCurveLateral	 = 16.7,
		TractionSpringDeltaMax   = 0.14,
		LowSpeedTractionLossMult = 0.070,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4026,
		TractionLossMult         = 1.32,

		-- Suspension
		SuspensionForce       = 2.92,
		SuspensionCompDamp    = 1.61,
		SuspensionReboundDamp = 0.89,
		SuspensionUpperLimit  = 0.062,
		SuspensionLowerLimit  = -0.125,
		SuspensionRaise		  = 0.004,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.4,
		RollCentreHeightFront = 0.361,
		RollCentreHeightRear  = 0.343,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.05,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 35000,
		ModelFlags		= '441010',
		HandlingFlags   = "21002",
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
		
		HandlingName = "NINEF",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.41,
		DownforceModifier  = 1.38,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.115, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.78 },

		-- Transmission
		DriveBiasFront                 = 0.165,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.309,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 2.3,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33,

		-- Brake
		BrakeForce     = 0.508,
		BrakeBiasFront = 0.502,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 2.12,
		TractionCurveMin         = 1.95,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.132,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4854,
		TractionLossMult         = 1.33,

		-- Suspension
		SuspensionForce       = 3.02,
		SuspensionCompDamp    = 1.25,
		SuspensionReboundDamp = 0.59,
		SuspensionUpperLimit  = 0.107,
		SuspensionLowerLimit  = -0.129,
		SuspensionRaise		  = -0.01,
		SuspensionBiasFront   = 0.471,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.510,
		RollCentreHeightFront = 0.462,
		RollCentreHeightRear  = 0.461,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 80000,
		ModelFlags		= '440010',
		HandlingFlags   = "2",
		DamageFlags		= "20",
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
		
		HandlingName = "NINEF2",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.41,
		DownforceModifier  = 1.38,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.115, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.78 },

		-- Transmission
		DriveBiasFront                 = 0.165,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.309,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 2.3,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33,

		-- Brake
		BrakeForce     = 0.508,
		BrakeBiasFront = 0.502,
		HandBrakeForce = 0.6,

		-- Traction
		TractionCurveMax         = 2.12,
		TractionCurveMin         = 1.95,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.132,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4854,
		TractionLossMult         = 1.33,

		-- Suspension
		SuspensionForce       = 3.02,
		SuspensionCompDamp    = 1.25,
		SuspensionReboundDamp = 0.59,
		SuspensionUpperLimit  = 0.107,
		SuspensionLowerLimit  = -0.129,
		SuspensionRaise		  = -0.01,
		SuspensionBiasFront   = 0.471,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.510,
		RollCentreHeightFront = 0.462,
		RollCentreHeightRear  = 0.461,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 80000,
		ModelFlags		= '440010',
		HandlingFlags   = "2",
		DamageFlags		= "20",
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
		
		HandlingName = "OMNIS",
		-- Physical
		Mass               = 1100,
		InitialDragCoeff   = 2.67,
		DownforceModifier  = 1.49,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.05, 0 },
		InertiaMultiplier  = { 1.06, 0.99,    1.62 },

		-- Transmission
		DriveBiasFront                 = 0.245,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.361,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 149,
		SteeringLock                   = 30.1,

		-- Brake
		BrakeForce     = 0.840,
		BrakeBiasFront = 0.470,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.32,
		TractionCurveMin         = 1.943,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.138,
		LowSpeedTractionLossMult = 1.16,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4833,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 2.94,
		SuspensionCompDamp    = 1.0,
		SuspensionReboundDamp = 1.0,
		SuspensionUpperLimit  = 0.072,
		SuspensionLowerLimit  = -0.118,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.,
		AntiRollBarBiasFront  = 0.282,
		RollCentreHeightFront = 0.7,
		RollCentreHeightRear  = 0.7,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "82000A",
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
		
		HandlingName = "PENUMBRA",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.75,
		DownforceModifier  = 1.38,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.13, 0.015 },
		InertiaMultiplier  = { 0.91, 0.56,    0.91 },

		-- Transmission
		DriveBiasFront                 = 1,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.273,
		DriveInertia                   = 0.89,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 135,
		SteeringLock                   = 32.2,

		-- Brake
		BrakeForce     = 0.561,
		BrakeBiasFront = 0.4643,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.93,
		TractionCurveMin         = 1.794,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.138,
		LowSpeedTractionLossMult = 1.07,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4791,
		TractionLossMult         = 1.23,

		-- Suspension
		SuspensionForce       = 2.43,
		SuspensionCompDamp    = 1.19,
		SuspensionReboundDamp = 0.81,
		SuspensionUpperLimit  = 0.104,
		SuspensionLowerLimit  = -0.138,
		SuspensionRaise		  = -0.008,
		SuspensionBiasFront   = 0.4435,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.319,
		RollCentreHeightRear  = 0.292,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
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
		
		HandlingName = "RAPIDGT",
		-- Physical
		Mass               = 1700,
		InitialDragCoeff   = 0.42,
		DownforceModifier  = 1.48,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.11, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.69 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.279,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.489,
		BrakeBiasFront = 0.47863,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.12,
		TractionCurveMin         = 2.052,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4816,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.82,
		SuspensionCompDamp    = 1.32,
		SuspensionReboundDamp = 0.52,
		SuspensionUpperLimit  = 0.103,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = -0.008,
		SuspensionBiasFront   = 0.481,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.435,
		RollCentreHeightRear  = 0.433,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
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
		
		HandlingName = "RAPIDGT2",
		-- Physical
		Mass               = 1850,
		InitialDragCoeff   = 2.83,
		DownforceModifier  = 1.35,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0, -0.22 },
		InertiaMultiplier  = { 1.17, 1,    1.73 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.305,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 148,
		SteeringLock                   = 32.4,

		-- Brake
		BrakeForce     = 0.575,
		BrakeBiasFront = 0.4925,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.954,
		TractionCurveMin         = 1.822,
		TractionCurveLateral	 = 17.0,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4792,
		TractionLossMult         = 1.27,

		-- Suspension
		SuspensionForce       = 2.61,
		SuspensionCompDamp    = 1.28,
		SuspensionReboundDamp = 0.58,
		SuspensionUpperLimit  = 0.063,
		SuspensionLowerLimit  = -0.142,
		SuspensionRaise		  = 0.009,
		SuspensionBiasFront   = 0.501,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.3,
		RollCentreHeightFront = 0.328,
		RollCentreHeightRear  = 0.308,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0.025,
		SeatOffsetDistY = -0.175,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
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
	CHandlingData {
		
		HandlingName = "RAIDEN",
		-- Physical
		Mass               = 2100,
		InitialDragCoeff   = 5.25,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.05, -0.2 },
		InertiaMultiplier  = { 1, 1.3,    1.5 },

		-- Transmission
		DriveBiasFront                 = 0.35,
		InitialDriveGears              = 1,
		InitialDriveForce              = 0.245,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 9,
		ClutchChangeRateScaleDownShift = 9,
		InitialDriveMaxFlatVel         = 186.25,
		SteeringLock                   = 40,

		-- Brake
		BrakeForce     = 0.5,
		BrakeBiasFront = 0.6,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 2.15,
		TractionCurveMin         = 1.9,
		TractionCurveLateral	 = 22.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.49,
		TractionLossMult         = 1,

		-- Suspension
		SuspensionForce       = 2,
		SuspensionCompDamp    = 1.25,
		SuspensionReboundDamp = 2.5,
		SuspensionUpperLimit  = 0.05,
		SuspensionLowerLimit  = -0.075,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.48,
		AntiRollBarForce	  = 0.5,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.24,
		RollCentreHeightRear  = 0.24,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0.08,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 35000,
		ModelFlags		= '441010',
		HandlingFlags   = "21002",
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
		
		HandlingName = "RETINUE",
		-- Physical
		Mass               = 880,
		InitialDragCoeff   = 2.01,
		DownforceModifier  = 1.26,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    0.05, 0.01 },
		InertiaMultiplier  = { 1.09, 0.98,    1.35 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.259,
		DriveInertia                   = 1.2,
		ClutchChangeRateScaleUpShift   = 1.15,
		ClutchChangeRateScaleDownShift = 1.2,
		InitialDriveMaxFlatVel         = 124,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 0.585,
		BrakeBiasFront = 0.526,
		HandBrakeForce = 0.85,

		-- Traction
		TractionCurveMax         = 2.08,
		TractionCurveMin         = 1.952,
		TractionCurveLateral	 = 17,
		TractionSpringDeltaMax   = 0.145,
		LowSpeedTractionLossMult = 1.07,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 0.92,

		-- Suspension
		SuspensionForce       = 2.4,
		SuspensionCompDamp    = 1.28,
		SuspensionReboundDamp = 0.59,
		SuspensionUpperLimit  = 0.086,
		SuspensionLowerLimit  = -0.149,
		SuspensionRaise		  = 0.034,
		SuspensionBiasFront   = 0.56,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.4,
		RollCentreHeightFront = 0.279,
		RollCentreHeightRear  = 0.261,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "82000A",
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
		
		HandlingName = "REVOLTER", -- No Handling
		-- Physical
		Mass               = 2600,
		InitialDragCoeff   = 2.5,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.08, 0 },
		InertiaMultiplier  = { 1.2, 1.4,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0.5,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.30,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.5,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 140,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.55,
		BrakeBiasFront = 0.5,
		HandBrakeForce = 0.35,

		-- Traction
		TractionCurveMax         = 2.25,
		TractionCurveMin         = 1.95,
		TractionCurveLateral	 = 22.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1.1,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.5,
		TractionLossMult         = 1,

		-- Suspension
		SuspensionForce       = 2.2,
		SuspensionCompDamp    = 2,
		SuspensionReboundDamp = 6,
		SuspensionUpperLimit  = 0.085,
		SuspensionLowerLimit  = -0.12,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.52,
		AntiRollBarForce	  = 0.8,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.15,
		RollCentreHeightRear  = 0.15,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 0.7,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "820002",
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
		
		HandlingName = "RUSTON",
		-- Physical
		Mass               = 750,
		InitialDragCoeff   = 2.29,
		DownforceModifier  = 1.95,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.181, 0.01 },
		InertiaMultiplier  = { 1.13, 0.98,    1.43 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.284,
		DriveInertia                   = 1.05,
		ClutchChangeRateScaleUpShift   = 2,
		ClutchChangeRateScaleDownShift = 2,
		InitialDriveMaxFlatVel         = 135,
		SteeringLock                   = 32.6,

		-- Brake
		BrakeForce     = 0.649,
		BrakeBiasFront = 0.466,
		HandBrakeForce = 0.85,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.74,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.03,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4903,
		TractionLossMult         = 1.06,

		-- Suspension
		SuspensionForce       = 3.36,
		SuspensionCompDamp    = 1.36,
		SuspensionReboundDamp = 0.75,
		SuspensionUpperLimit  = 0.0487,
		SuspensionLowerLimit  = -0.119,
		SuspensionRaise		  = -0.015,
		SuspensionBiasFront   = 0.418,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.4,
		RollCentreHeightFront = 0.281,
		RollCentreHeightRear  = 0.257,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 6.5,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000000",
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
		
		HandlingName = "SEVEN70",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 3.94,
		DownforceModifier  = 1.57,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.14, 0.01 },
		InertiaMultiplier  = { 1.16, 1,    1.66 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.395,
		DriveInertia                   = 0.98,
		ClutchChangeRateScaleUpShift   = 2.3,
		ClutchChangeRateScaleDownShift = 2.3,
		InitialDriveMaxFlatVel         = 225,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.431,
		BrakeBiasFront = 0.453,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.06,
		TractionCurveMin         = 1.961,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 0.68,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4851,
		TractionLossMult         = 1.32,

		-- Suspension
		SuspensionForce       = 2.85,
		SuspensionCompDamp    = 1.26,
		SuspensionReboundDamp = 0.55,
		SuspensionUpperLimit  = 0.0935,
		SuspensionLowerLimit  = -0.135,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.456,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.1501,
		RollCentreHeightRear  = 0.147,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
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
		
		HandlingName = "SENTINEL3",
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 4.3,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, 0 },
		InertiaMultiplier  = { 1.2, 1.4,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 9,
		InitialDriveForce              = 0.6,
		DriveInertia                   = 1.4,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.1,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33,

		-- Brake
		BrakeForce     = 0.66,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.3,

		-- Traction
		TractionCurveMax         = 2.3,
		TractionCurveMin         = 2.1,
		TractionCurveLateral	 = 17,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 0.6,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.49,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 1.2,
		SuspensionReboundDamp = 1.3,
		SuspensionUpperLimit  = 0.1,
		SuspensionLowerLimit  = -0.18,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.6,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.36,
		RollCentreHeightRear  = 0.36,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 35000,
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
		
		HandlingName = "SCHLAGEN",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 1.53,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.1, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.69 },

		-- Transmission
		DriveBiasFront                 = 0.25,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.241,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 2,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 200,
		SteeringLock                   = 40.1,

		-- Brake
		BrakeForce     = 0.229,
		BrakeBiasFront = 0.479,
		HandBrakeForce = 0.4,

		-- Traction
		TractionCurveMax         = 2.03,
		TractionCurveMin         = 1.1,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 0.22,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.483,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 2.66,
		SuspensionCompDamp    = 1.31,
		SuspensionReboundDamp = 0.54,
		SuspensionUpperLimit  = 0.129,
		SuspensionLowerLimit  = -0.135,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.448,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.389,
		RollCentreHeightRear  = 0.387,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 30000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000",
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
		
		HandlingName = "SPECTER",
		-- Physical
		Mass               = 1650,
		InitialDragCoeff   = 2.24,
		DownforceModifier  = 1.47,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.24, 0.03 },
		InertiaMultiplier  = { 1.18, 1,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.293,
		DriveInertia                   = 1.02,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33,

		-- Brake
		BrakeForce     = 0.504,
		BrakeBiasFront = 0.4542,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.97,
		TractionCurveMin         = 1.891,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.141,
		LowSpeedTractionLossMult = 1.05,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 1.31,

		-- Suspension
		SuspensionForce       = 2.89,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.59,
		SuspensionUpperLimit  = 0.078,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.468,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.211,
		RollCentreHeightRear  = 0.182,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
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
		
		HandlingName = "SURANO",
		-- Physical
		Mass               = 1750,
		InitialDragCoeff   = 1.07,
		DownforceModifier  = 1.41,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.115, 0.03 },
		InertiaMultiplier  = { 1.18, 1.02,    2.33 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.325,
		DriveInertia                   = 1.01,
		ClutchChangeRateScaleUpShift   = 6.2,
		ClutchChangeRateScaleDownShift = 4.6,
		InitialDriveMaxFlatVel         = 212,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.283,
		BrakeBiasFront = 0.526,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.38,
		TractionCurveMin         = 1.137,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.138,
		LowSpeedTractionLossMult = 0.23,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4844,
		TractionLossMult         = 1.24,

		-- Suspension
		SuspensionForce       = 2.76,
		SuspensionCompDamp    = 1.32,
		SuspensionReboundDamp = 0.52,
		SuspensionUpperLimit  = 0.11,
		SuspensionLowerLimit  = -0.138,
		SuspensionRaise		  = 0.018,
		SuspensionBiasFront   = 0.486,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.465,
		RollCentreHeightRear  = 0.464,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 80000,
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
		
		HandlingName = "TROPOS",
		-- Physical
		Mass               = 980,
		InitialDragCoeff   = 1.09,
		DownforceModifier  = 1.08,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.165, 0 },
		InertiaMultiplier  = { 1.1, 1.08,    1.46 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.273,
		DriveInertia                   = 1.04,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 166,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.452,
		BrakeBiasFront = 0.4187,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.23,
		TractionCurveMin         = 1.012,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.139,
		LowSpeedTractionLossMult = 0.11,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4877,
		TractionLossMult         = 0.85,

		-- Suspension
		SuspensionForce       = 2.91,
		SuspensionCompDamp    = 1.42,
		SuspensionReboundDamp = 0.55,
		SuspensionUpperLimit  = 0.067,
		SuspensionLowerLimit  = -0.121,
		SuspensionRaise		  = -0.002,
		SuspensionBiasFront   = 0.446,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.1,
		RollCentreHeightFront = 0.203,
		RollCentreHeightRear  = 0.205,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "82000A",
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
		
		HandlingName = "VERLIERER2", -- No Handling
		-- Physical
		Mass               = 2300,
		InitialDragCoeff   = 2.28,
		DownforceModifier  = 1.09,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.22, -0.04 },
		InertiaMultiplier  = { 1, 1.06,    1.7 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.355,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 187,
		SteeringLock                   = 35,

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
		CamberStiffnesss		 = 0,
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
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.05,
		SeatOffsetDistZ = 0,
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
}