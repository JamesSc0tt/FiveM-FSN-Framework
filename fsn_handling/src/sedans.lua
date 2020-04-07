-- Sedan Cars
return {
	CHandlingData {
		HandlingName = "ASEA",
		-- Physical
		Mass               = 1300,
		InitialDragCoeff   = 2.02,
		DownforceModifier  = 1.21,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.17, -0.042 },
		InertiaMultiplier  = { 1.15, 1,    1.51 },

		-- Transmission
		DriveBiasFront                 = 1,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.2494,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.575,
		BrakeBiasFront = 0.478,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.801,
		TractionCurveLateral	 = 16.4,
		TractionSpringDeltaMax   = 0.128,
		LowSpeedTractionLossMult = 0.05,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.481,
		TractionLossMult         = 1.25,

		-- Suspension
		SuspensionForce       = 2.31,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.138,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.44,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.345,
		RollCentreHeightRear  = 0.343,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.5,
		EngineDamageMult			= 0.7,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
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
		
		HandlingName = "ASTEROPE",
		-- Physical
		Mass               = 1700,
		InitialDragCoeff   = 2.89,
		DownforceModifier  = 1.28,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.051, 0.005 },
		InertiaMultiplier  = { 1.18, 1,    1.78 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.237,
		DriveInertia                   = 0.89,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 155,
		SteeringLock                   = 32.2,

		-- Brake
		BrakeForce     = 0.441,
		BrakeBiasFront = 0.4131,
		HandBrakeForce = 0.80,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.74,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.138,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4786,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.41,
		SuspensionCompDamp    = 1.53,
		SuspensionReboundDamp = 0.42,
		SuspensionUpperLimit  = 0.131,
		SuspensionLowerLimit  = -0.135,
		SuspensionRaise		  = -0.021,
		SuspensionBiasFront   = 0.456,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.361,
		RollCentreHeightRear  = 0.366,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 35000,
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
		
		HandlingName = "COGNOSCENTI", -- COGNOSC  
		-- Physical
		Mass               = 2700,
		InitialDragCoeff   = 2.401,
		DownforceModifier  = 1.26,
		PercentSubmerged   = 82,
		CentreOfMassOffset = { 0,    -0.03, 0.02 },
		InertiaMultiplier  = { 1.18, 1.02,    1.78 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.26,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.5,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 140,
		SteeringLock                   = 34.8,

		-- Brake
		BrakeForce     = 0.431,
		BrakeBiasFront = 0.516,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.81,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4793,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 1.8,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 2.0,
		SuspensionUpperLimit  = 0.135,
		SuspensionLowerLimit  = -0.115,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.49,
		AntiRollBarForce	  = 0.65,
		AntiRollBarBiasFront  = 0.675,
		RollCentreHeightFront = 0.2,
		RollCentreHeightRear  = 0.2,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.225,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '440010',
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
		
		HandlingName = "COG55",
		-- Physical
		Mass               = 2500,
		InitialDragCoeff   = 2.43,
		DownforceModifier  = 1.26,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.04, 0.02 },
		InertiaMultiplier  = { 1.16, 1.03,    1.75 },

		-- Transmission
		DriveBiasFront                 = 0.135,
		InitialDriveGears              = 7,
		InitialDriveForce              = 0.2505,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 144,
		SteeringLock                   = 33.9,

		-- Brake
		BrakeForce     = 0.445,
		BrakeBiasFront = 0.5203,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.17,
		TractionCurveMin         = 1.98,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4801,
		TractionLossMult         = 1.30,

		-- Suspension
		SuspensionForce       = 2.31,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.48,
		SuspensionUpperLimit  = 0.124,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.466,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.318,
		RollCentreHeightRear  = 0.316,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.175,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '440010',
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
		
		HandlingName = "FACTION3",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.0,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, 0 },
		InertiaMultiplier  = { 1, 1,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.26,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 170,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.75,
		BrakeBiasFront = 0.649,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.8,
		TractionCurveLateral	 = 22.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 1.2,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.5,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 2.2,
		SuspensionCompDamp    = 0.8,
		SuspensionReboundDamp = 1.3,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.14,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.47,
		AntiRollBarForce	  = 0.4,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.325,
		RollCentreHeightRear  = 0.325,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '220010',
		HandlingFlags   = "8000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75
			}
		}
	},
	CHandlingData {
		
		HandlingName = "FUGITIVE",
		-- Physical
		Mass               = 1950,
		InitialDragCoeff   = 2.55,
		DownforceModifier  = 1.33,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.06, -0.24 },
		InertiaMultiplier  = { 1.16, 1,    1.58 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.25,
		DriveInertia                   = 1.2,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 0.455,
		BrakeBiasFront = 0.48245,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.19,
		TractionCurveMin         = 1.926,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.129,
		LowSpeedTractionLossMult = 1.02,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4834,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.45,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 0.46,
		SuspensionUpperLimit  = 0.114,
		SuspensionLowerLimit  = -0.138,
		SuspensionRaise		  = -0.009,
		SuspensionBiasFront   = 0.495,
		AntiRollBarBiasFront  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.281,
		RollCentreHeightRear  = 0.279,

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
		
		HandlingName = "GLENDALE",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.85,
		DownforceModifier  = 1.16,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.04, 0.02 },
		InertiaMultiplier  = { 1.19, 1,    1.77 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.209,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 122,
		SteeringLock                   = 33.7,

		-- Brake
		BrakeForce     = 0.517,
		BrakeBiasFront = 0.46181,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.93,
		TractionCurveMin         = 1.79,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.18,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4833,
		TractionLossMult         = 1.21,

		-- Suspension
		SuspensionForce       = 2.21,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.18,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.487,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.513,
		RollCentreHeightRear  = 0.511,

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
		MonetaryValue   = 100000,
		ModelFlags		= '440010',
		HandlingFlags   = "1",
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
		
		HandlingName = "INGOT",
		-- Physical
		Mass               = 1450,
		InitialDragCoeff   = 2.8,
		DownforceModifier  = 1.25,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.12, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.71 },

		-- Transmission
		DriveBiasFront                 = 1,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.2278,
		DriveInertia                   = 0.93,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 132,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.512,
		BrakeBiasFront = 0.4481,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.944,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.129,
		LowSpeedTractionLossMult = 1.04,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.476,
		TractionLossMult         = 1.24,

		-- Suspension
		SuspensionForce       = 2.21,
		SuspensionCompDamp    = 1.56,
		SuspensionReboundDamp = 0.37,
		SuspensionUpperLimit  = 0.15,
		SuspensionLowerLimit  = -0.134,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.425,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.478,
		RollCentreHeightRear  = 0.476,

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
		
		HandlingName = "INTRUDER",
		-- Physical
		Mass               = 1950,
		InitialDragCoeff   = 2.56,
		DownforceModifier  = 1.34,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.09, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.51 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.2651,
		DriveInertia                   = 1.01,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.441,
		BrakeBiasFront = 0.5108,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.16,
		TractionCurveMin         = 2.017,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.136,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4809,
		TractionLossMult         = 1.25,

		-- Suspension
		SuspensionForce       = 2.51,
		SuspensionCompDamp    = 1.45,
		SuspensionReboundDamp = 0.45,
		SuspensionUpperLimit  = 0.131,
		SuspensionLowerLimit  = -0.131,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.491,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.422,
		RollCentreHeightRear  = 0.420,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0,
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
		
		HandlingName = "PREMIER",
		-- Physical
		Mass               = 1350,
		InitialDragCoeff   = 2.85,
		DownforceModifier  = 1.24,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.162, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.62 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.222,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 134,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.527,
		BrakeBiasFront = 0.4067,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.37,
		TractionCurveMin         = 2.04,
		TractionCurveLateral	 = 16.7,
		TractionSpringDeltaMax   = 0.129,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4773,
		TractionLossMult         = 1.23,

		-- Suspension
		SuspensionForce       = 2.29,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.38,
		SuspensionUpperLimit  = 0.145,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.015,
		SuspensionBiasFront   = 0.454,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.326,
		RollCentreHeightRear  = 0.326,

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
		
		HandlingName = "PRIMO",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.27,
		DownforceModifier  = 1.25,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.175, -0.03 },
		InertiaMultiplier  = { 1.17, 1,    1.54 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.219,
		DriveInertia                   = 0.91,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 133,
		SteeringLock                   = 32.9,

		-- Brake
		BrakeForce     = 0.516,
		BrakeBiasFront = 0.45225,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.97,
		TractionCurveMin         = 1.74,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4796,
		TractionLossMult         = 1.23,

		-- Suspension
		SuspensionForce       = 2.18,
		SuspensionCompDamp    = 1.57,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.135,
		SuspensionLowerLimit  = -0.142,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.441,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.297,
		RollCentreHeightRear  = 0.296,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 35000,
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
		
		HandlingName = "PRIMO2",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.26,
		DownforceModifier  = 1.27,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.175, -0.043 },
		InertiaMultiplier  = { 1.17, 1.06,    1.54 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.2401,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 2.0,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 137,
		SteeringLock                   = 33.0,

		-- Brake
		BrakeForce     = 0.524,
		BrakeBiasFront = 0.47403,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.28,
		TractionCurveMin         = 1.979,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.129,
		LowSpeedTractionLossMult = 1.02,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4833,
		TractionLossMult         = 1.21,

		-- Suspension
		SuspensionForce       = 2.42,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.53,
		SuspensionUpperLimit  = 0.123,
		SuspensionLowerLimit  = -0.151,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.431,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.244,
		RollCentreHeightRear  = 0.243,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 35000,
		ModelFlags		= 'd40010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.06,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "REGINA",
		-- Physical
		Mass               = 1950,
		InitialDragCoeff   = 2.92,
		DownforceModifier  = 1.14,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.09, 0.02 },
		InertiaMultiplier  = { 0.96, 0.91,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.214,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.18,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 126,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.485,
		BrakeBiasFront = 0.498,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.77,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4813,
		TractionLossMult         = 1.19,

		-- Suspension
		SuspensionForce       = 1.99,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.146,
		SuspensionLowerLimit  = -0.142,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.515,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.35,
		RollCentreHeightRear  = 0.35,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
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
		-- Since SCHAFTER2 is what the default values are based on we don't need to do anything
		HandlingName = "SCHAFTER2"
	},
	CHandlingData {
		-- Only changes what differs from SCHAFTER2, https://www.diffchecker.com
		HandlingName = "SCHAFTER3",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.53,
		DownforceModifier  = 1.31,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.1, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.69 },

		-- Transmission
		DriveBiasFront                 = 0.2,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.319,
		DriveInertia                   = 1.05,
		ClutchChangeRateScaleUpShift   = 2,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 36.1,

		-- Brake
		BrakeForce     = 0.485,
		BrakeBiasFront = 0.47982,
		HandBrakeForce = 0.9,

		-- Traction
		TractionCurveMax         = 2.05,
		TractionCurveMin         = 1.95,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.02,
		TractionBiasFront        = 0.4831,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 2.66,
		SuspensionCompDamp    = 1.31,
		SuspensionReboundDamp = 0.54,
		SuspensionLowerLimit  = -0.135,
		SuspensionBiasFront   = 0.448,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.389,
		RollCentreHeightRear  = 0.387,

		-- Misc
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 95000,
		HandlingFlags   = "0820102",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult = 0.04,
			}
		}
	},
	CHandlingData {
		-- Has all the things
		HandlingName = "SCHAFTER4",
		-- Physical
		Mass               = 2100,
		InitialDragCoeff   = 0.49,
		DownforceModifier  = 1.29,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.24, 0.02 },
		InertiaMultiplier  = { 1.18, 1,     1.68 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.211,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 196,
		SteeringLock                   = 34.3,

		-- Brake
		BrakeForce     = 0.245,
		BrakeBiasFront = 0.48068,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.39,
		TractionCurveMin         = 1.13,
		TractionCurveLateral     = 16.6,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 0.22,
		CamberStiffnesss         = 0,
		TractionBiasFront        = 0.4834,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 2.52,
		SuspensionCompDamp    = 1.27,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.129,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise       = 0,
		SuspensionBiasFront   = 0.458,
		AntiRollBarForce      = 0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.383,
		RollCentreHeightRear  = 0.381,

		-- Damage
		CollisionDamageMult   = 1.0,
		WeaponDamageMult	  = 1.0,
		DeformationDamageMult = 0.7,
		EngineDamageMult	  = 1.5,
		PetrolTankVolume	  = 60.0,
		OilVolume			  = 5.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 75000,
		ModelFlags      = "440010",
		HandlingFlags   = "0820100",
		DamageFlags     = "0",
		AIHandling      = "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "STANIER",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.51,
		DownforceModifier  = 1.24,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0.06, 0.02 },
		InertiaMultiplier  = { 1.16, 1,    1.48 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.2489,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 133,
		SteeringLock                   = 33.8,

		-- Brake
		BrakeForce     = 0.515,
		BrakeBiasFront = 0.5077,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.99,
		TractionCurveMin         = 1.881,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4828,
		TractionLossMult         = 1.21,

		-- Suspension
		SuspensionForce       = 2.11,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.144,
		SuspensionLowerLimit  = -0.151,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.499,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.42,
		RollCentreHeightRear  = 0.42,

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
		
		HandlingName = "STRATUM",
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 2.71,
		DownforceModifier  = 1.28,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.105, 0 },
		InertiaMultiplier  = { 1.15, 1,    1.63 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.1955,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 139,
		SteeringLock                   = 32.6,

		-- Brake
		BrakeForce     = 0.522,
		BrakeBiasFront = 0.4616,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.84,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.129,
		LowSpeedTractionLossMult = 1.04,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4768,
		TractionLossMult         = 1.24,

		-- Suspension
		SuspensionForce       = 2.35,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.41,
		SuspensionUpperLimit  = 0.135,
		SuspensionLowerLimit  = -0.138,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.48,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.185,
		RollCentreHeightRear  = 0.183,

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
		
		HandlingName = "STRETCH",
		-- Physical
		Mass               = 2800,
		InitialDragCoeff   = 2.36,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    -0.36, 0.01 },
		InertiaMultiplier  = { 1, 1.13,    2.1 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.224,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.0,
		InitialDriveMaxFlatVel         = 142,
		SteeringLock                   = 40.0,

		-- Brake
		BrakeForce     = 0.47,
		BrakeBiasFront = 0.399,
		HandBrakeForce = 0.72,

		-- Traction
		TractionCurveMax         = 1.93,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.483,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 1.43,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 0.3,
		SuspensionUpperLimit  = 0.17,
		SuspensionLowerLimit  = -0.155,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.46,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.46,
		RollCentreHeightRear  = 0.46,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 35000,
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
		
		HandlingName = "SULTAN",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 2.05,
		DownforceModifier  = 1.28,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0.136, -0.023 },
		InertiaMultiplier  = { 0.99, 1.03,    1.74 },

		-- Transmission
		DriveBiasFront                 = 0.155,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.300,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 2.4,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 35.2,

		-- Brake
		BrakeForce     = 0.441,
		BrakeBiasFront = 0.5573,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.15,
		TractionCurveMin         = 1.96,
		TractionCurveLateral	 = 14.4,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4789,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 1.82,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.157,
		SuspensionLowerLimit  = -0.165,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.557,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.24,
		RollCentreHeightRear  = 0.25,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
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
		
		HandlingName = "SUPERD",
		-- Physical
		Mass               = 2800,
		InitialDragCoeff   = 2.7,
		DownforceModifier  = 1.15,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0.01, 0.03 },
		InertiaMultiplier  = { 1.2, 1.07,    1.65 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.265,
		DriveInertia                   = 0.98,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 23.8,

		-- Brake
		BrakeForce     = 0.515,
		BrakeBiasFront = 0.50873,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.2,
		TractionCurveMin         = 1.95,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 0.19,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4821,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 2.21,
		SuspensionCompDamp    = 1.39,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.159,
		SuspensionLowerLimit  = -0.139,
		SuspensionRaise		  = -0.012,
		SuspensionBiasFront   = 0.481,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.336,
		RollCentreHeightRear  = 0.334,

		-- Damage
		CollisionDamageMult         = 0.35,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.3,
		EngineDamageMult			= 0.4,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 25000,
		ModelFlags		= '440010',
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
		
		HandlingName = "SURGE",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 2.85,
		DownforceModifier  = 1.29,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.28, -0.05 },
		InertiaMultiplier  = { 1.17, 1,    1.85 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 8,
		InitialDriveForce              = 0.10301,
		DriveInertia                   = 1.24,
		ClutchChangeRateScaleUpShift   = 50.0,
		ClutchChangeRateScaleDownShift = 50.0,
		InitialDriveMaxFlatVel         = 140,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.53,
		BrakeBiasFront = 0.4318,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.129,
		LowSpeedTractionLossMult = 1.16,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4803,
		TractionLossMult         = 1.23,

		-- Suspension
		SuspensionForce       = 2.31,
		SuspensionCompDamp    = 1.54,
		SuspensionReboundDamp = 0.42,
		SuspensionUpperLimit  = 0.105,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.012,
		SuspensionBiasFront   = 0.419,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.465,
		RollCentreHeightRear  = 0.463,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
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
		
		HandlingName = "TORNADO",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 2.89,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.24, -0.096 },
		InertiaMultiplier  = { 1.01, 1.09,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 3,
		InitialDriveForce              = 0.232,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.25,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 34.0,

		-- Brake
		BrakeForce     = 0.46,
		BrakeBiasFront = 0.6151,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.89,
		TractionCurveLateral	 = 15.0,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.44708,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 1.72,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 0.33,
		SuspensionUpperLimit  = 0.168,
		SuspensionLowerLimit  = -0.147,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.557,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.36,
		RollCentreHeightRear  = 0.36,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0.05,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.05,
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
		
		HandlingName = "TAILGATER",
		-- Physical
		Mass               = 1900,
		InitialDragCoeff   = 2.73,
		DownforceModifier  = 1.32,
		PercentSubmerged   = 70,
		CentreOfMassOffset = { 0,    0.01, 0.02 },
		InertiaMultiplier  = { 1.17, 1,    1.67 },

		-- Transmission
		DriveBiasFront                 = 0.145,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.225,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.551,
		BrakeBiasFront = 0.5017,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.21,
		TractionCurveMin         = 2.051,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.132,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.48296,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.52,
		SuspensionCompDamp    = 1.36,
		SuspensionReboundDamp = 0.53,
		SuspensionUpperLimit  = 0.141,
		SuspensionLowerLimit  = -0.136,
		SuspensionRaise		  = -0.005,
		SuspensionBiasFront   = 0.511,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.471,
		RollCentreHeightRear  = 0.469,

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
		
		HandlingName = "WARRENER",
		-- Physical
		Mass               = 1300,
		InitialDragCoeff   = 2.24,
		DownforceModifier  = 1.17,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.04, 0.09 },
		InertiaMultiplier  = { 1.15, 1,    1.57 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.279,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 34.0,

		-- Brake
		BrakeForce     = 0.515,
		BrakeBiasFront = 0.47331,
		HandBrakeForce = 0.85,

		-- Traction
		TractionCurveMax         = 2.23,
		TractionCurveMin         = 1.99,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.121,
		LowSpeedTractionLossMult = 1.02,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4833,
		TractionLossMult         = 1.19,

		-- Suspension
		SuspensionForce       = 2.31,
		SuspensionCompDamp    = 1.61,
		SuspensionReboundDamp = 0.41,
		SuspensionUpperLimit  = 0.164,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.014,
		SuspensionBiasFront   = 0.495,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.106,
		RollCentreHeightRear  = 0.104,

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
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 100000,
		ModelFlags		= '440010',
		HandlingFlags   = "1",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}	
		}
	},
	CHandlingData {
		
		HandlingName = "WASHINGTON",
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.66,
		DownforceModifier  = 1.19,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0.01, 0.02 },
		InertiaMultiplier  = { 1.17, 1.01,    1.57 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.2769,
		DriveInertia                   = 0.99,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 155,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.610,
		BrakeBiasFront = 0.4974,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.23,
		TractionCurveMin         = 2.06,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 0.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4921,
		TractionLossMult         = 0,

		-- Suspension
		SuspensionForce       = 1.91,
		SuspensionCompDamp    = 1.51,
		SuspensionReboundDamp = 0.34,
		SuspensionUpperLimit  = 0.167,
		SuspensionLowerLimit  = -0.141,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.488,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.318,
		RollCentreHeightRear  = 0.316,

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
}