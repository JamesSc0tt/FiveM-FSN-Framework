-- Super Cars
return {
	CHandlingData {
		HandlingName = "ADDER",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 3.2021,
		DownforceModifier  = 1.59,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.221, 0.01 },
		InertiaMultiplier  = { 1.15, 1.06,    1.69 },

		-- Transmission
		DriveBiasFront                 = 0.001,
		InitialDriveGears              = 7,
		InitialDriveForce              = 0.3901,
		DriveInertia                   = 1.07,
		ClutchChangeRateScaleUpShift   = 6.8,
		ClutchChangeRateScaleDownShift = 5.8,
		InitialDriveMaxFlatVel         = 228,
		SteeringLock                   = 32.2,

		-- Brake
		BrakeForce     = 0.541,
		BrakeBiasFront = 0.44614,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.07,
		TractionCurveMin         = 1.95,
		TractionCurveLateral	 = 16.45,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.199,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4824,
		TractionLossMult         = 1.34,

		-- Suspension
		SuspensionForce       = 2.99,
		SuspensionCompDamp    = 1.14,
		SuspensionReboundDamp = 0.55,
		SuspensionUpperLimit  = 0.113,
		SuspensionLowerLimit  = -0.118,
		SuspensionRaise		  = -0.021,
		SuspensionBiasFront   = 0.443,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.445,
		RollCentreHeightRear  = 0.442,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.0,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 80000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.025,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BANSHEE",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 3.95,
		DownforceModifier  = 1.45,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.14, 0.015 },
		InertiaMultiplier  = { 1.15, 1,    1.44 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.277,
		DriveInertia                   = 0.96,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33.0,

		-- Brake
		BrakeForce     = 0.497,
		BrakeBiasFront = 0.50105,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 2.08,
		TractionCurveMin         = 1.993,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.48499,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.87,
		SuspensionCompDamp    = 1.29,
		SuspensionReboundDamp = 0.48,
		SuspensionUpperLimit  = 0.091,
		SuspensionLowerLimit  = -0.124,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.475,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.4201,
		RollCentreHeightRear  = 0.418,

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
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BULLET",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 3.96,
		DownforceModifier  = 1.54,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.245, -0.01 },
		InertiaMultiplier  = { 1.15, 0.99,    1.58 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.3281,
		DriveInertia                   = 0.91,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.7,
		InitialDriveMaxFlatVel         = 214,
		SteeringLock                   = 32.5,

		-- Brake
		BrakeForce     = 0.575,
		BrakeBiasFront = 0.44463,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.866,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.128,
		LowSpeedTractionLossMult = 1.18,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4846,
		TractionLossMult         = 1.32,

		-- Suspension
		SuspensionForce       = 3.32,
		SuspensionCompDamp    = 1.225,
		SuspensionReboundDamp = 0.52,
		SuspensionUpperLimit  =	0.099,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = -0.014,
		SuspensionBiasFront   = 0.443,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.277,
		RollCentreHeightRear  = 0.275,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.5,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
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
		
		HandlingName = "CHEETAH",
		-- Physical
		Mass               = 1350,
		InitialDragCoeff   = 2.55,
		DownforceModifier  = 2.05,
		PercentSubmerged   = 70,
		CentreOfMassOffset = { 0,    -0.198, 0.01 },
		InertiaMultiplier  = { 1.13, 0.99,    1.43 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.408,
		DriveInertia                   = 0.91,
		ClutchChangeRateScaleUpShift   = 3.8,
		ClutchChangeRateScaleDownShift = 4.1,
		InitialDriveMaxFlatVel         = 219,
		SteeringLock                   = 32.6,

		-- Brake
		BrakeForce     = 0.545,
		BrakeBiasFront = 0.44111,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.19,
		TractionCurveMin         = 1.951,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.127,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4837,
		TractionLossMult         = 1.33,

		-- Suspension
		SuspensionForce       = 3.36,
		SuspensionCompDamp    = 1.23,
		SuspensionReboundDamp = 0.565,
		SuspensionUpperLimit  = 0.103,
		SuspensionLowerLimit  = -0.123,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.454,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.204,
		RollCentreHeightRear  = 0.202,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 25000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
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
		
		HandlingName = "ENTITYXF",
		-- Physical
		Mass               = 1350,
		InitialDragCoeff   = 2.098,
		DownforceModifier  = 1.57,
		PercentSubmerged   = 70,
		CentreOfMassOffset = { 0,    -0.271, 0.01 },
		InertiaMultiplier  = { 1.14, 0.99,    1.53 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.399,
		DriveInertia                   = 0.98,
		ClutchChangeRateScaleUpShift   = 2.2,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 228,
		SteeringLock                   = 32.6,

		-- Brake
		BrakeForce     = 0.542,
		BrakeBiasFront = 0.42155,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.22,
		TractionCurveMin         = 1.994,
		TractionCurveLateral	 = 16.4,
		TractionSpringDeltaMax   = 1.128,
		LowSpeedTractionLossMult = 0.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4844,
		TractionLossMult         = 1.33,

		-- Suspension
		SuspensionForce       = 3.29,
		SuspensionCompDamp    = 1.23,
		SuspensionReboundDamp = 0.505,
		SuspensionUpperLimit  = 0.075,
		SuspensionLowerLimit  = -0.131,
		SuspensionRaise		  = -0.008,
		SuspensionBiasFront   = 0.467,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.325,
		RollCentreHeightRear  = 0.322,

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
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
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
		
		HandlingName = "SHEAVA",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 4.29,
		DownforceModifier  = 2.14,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.131, 0.01 },
		InertiaMultiplier  = { 1.15, 0.99,    1.38 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.349,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 3.6,
		ClutchChangeRateScaleDownShift = 3.1,
		InitialDriveMaxFlatVel         = 212,
		SteeringLock                   = 33.3,

		-- Brake
		BrakeForce     = 0.551,
		BrakeBiasFront = 0.44682,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.193,
		TractionCurveMin         = 1.912,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.125,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4837,
		TractionLossMult         = 1.36,

		-- Suspension
		SuspensionForce       = 2.65,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 2.2,
		SuspensionUpperLimit  = 0.03,
		SuspensionLowerLimit  = -0.09,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarBiasFront  = 0.9,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.34,
		RollCentreHeightRear  = 0.34,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.15,
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
		
		HandlingName = "BANSHEE",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 3.95,
		DownforceModifier  = 1.45,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.14, 0.015 },
		InertiaMultiplier  = { 1.15, 1,    1.44 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.277,
		DriveInertia                   = 0.96,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 165,
		SteeringLock                   = 33.0,

		-- Brake
		BrakeForce     = 0.497,
		BrakeBiasFront = 0.50105,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 2.08,
		TractionCurveMin         = 1.993,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.48499,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.87,
		SuspensionCompDamp    = 1.29,
		SuspensionReboundDamp = 0.48,
		SuspensionUpperLimit  = 0.091,
		SuspensionLowerLimit  = -0.124,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.475,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.4201,
		RollCentreHeightRear  = 0.418,

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
		HandlingFlags   = "1",
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
		
		HandlingName = "FMJ",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.88,
		DownforceModifier  = 1.78,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.24, 0.015 },
		InertiaMultiplier  = { 1.16, 1,    1.59 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.394,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 2.8,
		ClutchChangeRateScaleDownShift = 3.1,
		InitialDriveMaxFlatVel         = 235,
		SteeringLock                   = 33.4,

		-- Brake
		BrakeForce     = 0.568,
		BrakeBiasFront = 0.44047,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.13,
		TractionCurveMin         = 1.98,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.125,
		LowSpeedTractionLossMult = 1.17,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4836,
		TractionLossMult         = 1.33,

		-- Suspension
		SuspensionForce       = 3.34,
		SuspensionCompDamp    = 1.24,
		SuspensionReboundDamp = 0.54,
		SuspensionUpperLimit  = 0.065,
		SuspensionLowerLimit  = -0.125,
		SuspensionRaise		  = 0.024,
		SuspensionBiasFront   = 0.469,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.309,
		RollCentreHeightRear  = 0.307,

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
		
		HandlingName = "INFERNUS",
		-- Physical
		Mass               = 1800,
		InitialDragCoeff   = 3.31,
		DownforceModifier  = 1.75,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.265, 0.0012 },
		InertiaMultiplier  = { 1.16, 1.05,    1.54 },

		-- Transmission
		DriveBiasFront                 = 0.173,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.366,
		DriveInertia                   = 0.93,
		ClutchChangeRateScaleUpShift   = 2.5,
		ClutchChangeRateScaleDownShift = 2.8,
		InitialDriveMaxFlatVel         = 209,
		SteeringLock                   = 32.9,

		-- Brake
		BrakeForce     = 0.543,
		BrakeBiasFront = 0.44791,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.178,
		TractionCurveMin         = 1.99,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.126,
		LowSpeedTractionLossMult = 1.205,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4841,
		TractionLossMult         = 1.33,

		-- Suspension
		SuspensionForce       = 3.11,
		SuspensionCompDamp    = 1.24,
		SuspensionReboundDamp = 0.475,
		SuspensionUpperLimit  = 0.0948,
		SuspensionLowerLimit  = -0.137,
		SuspensionRaise		  = -0.016,
		SuspensionBiasFront   = 0.468,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.51,
		RollCentreHeightFront = 0.371,
		RollCentreHeightRear  = 0.354,

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
		MonetaryValue   = 100000,
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
		
		HandlingName = "OSIRIS",
		-- Physical
		Mass               = 1450,
		InitialDragCoeff   = 1.74,
		DownforceModifier  = 1.92,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.202, 0.01 },
		InertiaMultiplier  = { 1.14, 0.99,    1.61 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.418,
		DriveInertia                   = 0.93,
		ClutchChangeRateScaleUpShift   = 2.9,
		ClutchChangeRateScaleDownShift = 3.1,
		InitialDriveMaxFlatVel         = 229,
		SteeringLock                   = 32.3,

		-- Brake
		BrakeForce     = 0.564,
		BrakeBiasFront = 0.43874,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.15,
		TractionCurveMin         = 1.948,
		TractionCurveLateral	 = 16.45,
		TractionSpringDeltaMax   = 0.127,
		LowSpeedTractionLossMult = 1.08,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4843,
		TractionLossMult         = 1.34,

		-- Suspension
		SuspensionForce       = 3.39,
		SuspensionCompDamp    = 1.22,
		SuspensionReboundDamp = 0.52,
		SuspensionUpperLimit  = 0.061,
		SuspensionLowerLimit  = -0.118,
		SuspensionRaise		  = -0.004,
		SuspensionBiasFront   = 0.448,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.446,
		RollCentreHeightRear  = 0.445,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.03,
		MonetaryValue   = 300000,
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
		
		HandlingName = "PARIAH",
		-- Physical
		Mass               = 1650,
		InitialDragCoeff   = 4.71,
		DownforceModifier  = 1.63,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.03, -0.09 },
		InertiaMultiplier  = { 1.18, 0.97,    1.68 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.379,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 205,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.571,
		BrakeBiasFront = 0.44429,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.45,
		TractionCurveMin         = 2.236,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.148,
		LowSpeedTractionLossMult = 1.25,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4776,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.91,
		SuspensionCompDamp    = 1.07,
		SuspensionReboundDamp = 1.03,
		SuspensionUpperLimit  = 0.089,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = 0.005,
		SuspensionBiasFront   = 0.499,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.281,
		RollCentreHeightRear  = 0.261,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 250000,
		ModelFlags		= '000010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.05,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
				ChamberFront					= -0.0,
				CamberRear						= -0.0,
				Castor							= 0.0,
				ToeFront						= -0.0,
				ToeRear							= 0.0,
				EngineResistance				= 0.005
			}
		}
	},
	CHandlingData {
		
		HandlingName = "PFISTER811",
		-- Physical
		Mass               = 1700,
		InitialDragCoeff   = 2.83,
		DownforceModifier  = 2.18,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.358, 0 },
		InertiaMultiplier  = { 1.19, 1.02,    2.35 },

		-- Transmission
		DriveBiasFront                 = 0.155,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.470,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 9.2,
		ClutchChangeRateScaleDownShift = 8.0,
		InitialDriveMaxFlatVel         = 215,
		SteeringLock                   = 33.1,

		-- Brake
		BrakeForce     = 0.5,
		BrakeBiasFront = 0.45898,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.18,
		TractionCurveMin         = 1.98,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.125,
		LowSpeedTractionLossMult = 1.45,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4841,
		TractionLossMult         = 1.36,

		-- Suspension
		SuspensionForce       = 3.25,
		SuspensionCompDamp    = 1.215,
		SuspensionReboundDamp = 0.565,
		SuspensionUpperLimit  = 0.094,
		SuspensionLowerLimit  = -0.122,
		SuspensionRaise		  = -0.009,
		SuspensionBiasFront   = 0.4613,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.1908,
		RollCentreHeightRear  = 0.1888,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.045,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25
			}
		}
	},
	CHandlingData {
		
		HandlingName = "REAPER",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 1.30,
		DownforceModifier  = 1.62,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.09, 0.0 },
		InertiaMultiplier  = { 1.17, 0.99,    1.47 },

		-- Transmission
        DriveBiasFront                 = 0.1,
        InitialDriveGears              = 6,
        InitialDriveForce              = 0.380,
        DriveInertia                   = 1.00,
        ClutchChangeRateScaleUpShift   = 7.5,
        ClutchChangeRateScaleDownShift = 6.0,
        InitialDriveMaxFlatVel         = 225,
        SteeringLock                   = 37.2,

        -- Brake
        BrakeForce     = 3.40,
        BrakeBiasFront = 0.4,
        HandBrakeForce = 1.4,

        -- Traction
        TractionCurveMax         = 2.6,
        TractionCurveMin         = 2.3,
        TractionCurveLateral     = 16.5,
        TractionSpringDeltaMax   = 0.139,
        LowSpeedTractionLossMult = 0.19,
        CamberStiffnesss         = 0.0,
        TractionBiasFront        = 0.4791,
        TractionLossMult         = 1.32,

		-- Suspension
		SuspensionForce       = 3.03,
		SuspensionCompDamp    = 1.28,
		SuspensionReboundDamp = 0.63,
		SuspensionUpperLimit  = 0.0808,
		SuspensionLowerLimit  = -0.135,
		SuspensionRaise		  = 0.016,
		SuspensionBiasFront   = 0.454,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.535,
		RollCentreHeightRear  = 0.496,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 0.7,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.15,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 130000,
		ModelFlags		= '000010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		HandlingName = "SC1",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 4.02,
		DownforceModifier  = 1.56,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.092, -0.19 },
		InertiaMultiplier  = { 1.23, 1,    2.16 },

		-- Transmission
		DriveBiasFront                 = 0.26,
		InitialDriveGears              = 8,
		InitialDriveForce              = 0.379,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 4.5,
		ClutchChangeRateScaleDownShift = 4.5,
		InitialDriveMaxFlatVel         = 212,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.551,
		BrakeBiasFront = 0.47641,
		HandBrakeForce = 0.85,

		-- Traction
		TractionCurveMax         = 2.16,
		TractionCurveMin         = 1.931,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.15,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4838,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 2.91,
		SuspensionCompDamp    = 1.07,
		SuspensionReboundDamp = 0.74,
		SuspensionUpperLimit  = 0.055,
		SuspensionLowerLimit  = -0.131,
		SuspensionRaise		  = 0.029,
		SuspensionBiasFront   = 0.488,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.386,
		RollCentreHeightRear  = 0.368,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 135000,
		ModelFlags		= '000010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.065,
				BackEndPopUpBuildingImpulseMult = 0.02,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
				ChamberFront					= -0.0,
				CamberRear						= -0.0,
				Castor							= 0.0,
				ToeFront						= -0.0,
				ToeRear							= 0.0,
				EngineResistance				= 0.01
			}
		}
	},
	CHandlingData {
		HandlingName = "SULTANRS",
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
		InitialDriveForce              = 0.42,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 2.4,
		InitialDriveMaxFlatVel         = 195,
		SteeringLock                   = 35.2,

		-- Brake
		BrakeForce     = 0.766,
		BrakeBiasFront = 0.5573,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.3,
		TractionCurveMin         = 2.1,
		TractionCurveLateral	 = 14.4,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4789,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 1.82,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.157,
		SuspensionLowerLimit  = -0.165,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.557,
		AntiRollBarForce	  = 1,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.24,
		RollCentreHeightRear  = 0.25,

		-- Damage
		CollisionDamageMult         = 0.7,
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
		
		HandlingName = "T20",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 2.09,
		DownforceModifier  = 2.19,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.136, 0.0012 },
		InertiaMultiplier  = { 1.16, 1.03,    2.02 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.407,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 7.5,
		ClutchChangeRateScaleDownShift = 6.0,
		InitialDriveMaxFlatVel         = 241,
		SteeringLock                   = 33.99,

		-- Brake
		BrakeForce     = 0.551,
		BrakeBiasFront = 0.48691,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.214,
		TractionCurveMin         = 1.993,
		TractionCurveLateral	 = 16.25,
		TractionSpringDeltaMax   = 0.128,
		LowSpeedTractionLossMult = 1.18,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4815,
		TractionLossMult         = 1.37,

		-- Suspension
		SuspensionForce       = 3.42,
		SuspensionCompDamp    = 1.28,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.0757,
		SuspensionLowerLimit  = -0.121,
		SuspensionRaise		  = 0.0143,
		SuspensionBiasFront   = 0.455,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.423,
		RollCentreHeightRear  = 0.414,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.15,
		SeatOffsetDistZ = 0.05,
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
		
		HandlingName = "TURISMOR",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 2.12,
		DownforceModifier  = 2.09,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.264, 0.15 },
		InertiaMultiplier  = { 1.15, 0.99,    1.54 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.431,
		DriveInertia                   = 0.91,
		ClutchChangeRateScaleUpShift   = 8.5,
		ClutchChangeRateScaleDownShift = 7.0,
		InitialDriveMaxFlatVel         = 246,
		SteeringLock                   = 32.4,

		-- Brake
		BrakeForce     = 0.747,
		BrakeBiasFront = 0.47962,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.225,
		TractionCurveMin         = 1.991,
		TractionCurveLateral	 = 16.45,
		TractionSpringDeltaMax   = 0.125,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4837,
		TractionLossMult         = 1.36,

		-- Suspension
		SuspensionForce       = 2.91,
		SuspensionCompDamp    = 1.17,
		SuspensionReboundDamp = 0.58,
		SuspensionUpperLimit  = 0.0811,
		SuspensionLowerLimit  = -0.123,
		SuspensionRaise		  = 0.037,
		SuspensionBiasFront   = 0.4615,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.193,
		RollCentreHeightRear  = 0.189,

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
		MonetaryValue   = 350000,
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
		
		HandlingName = "TEMPESTA",
		-- Physical
		Mass               = 1450,
		InitialDragCoeff   = 3.76,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.085, 0.13 },
		InertiaMultiplier  = { 1.17, 1,    1.57 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.434,
		DriveInertia                   = 0.96,
		ClutchChangeRateScaleUpShift   = 5.5,
		ClutchChangeRateScaleDownShift = 4.5,
		InitialDriveMaxFlatVel         = 231,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 0.731,
		BrakeBiasFront = 0.44504,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.26,
		TractionCurveMin         = 1.991,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.138,
		LowSpeedTractionLossMult = 1.22,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4819,
		TractionLossMult         = 1.29,

		-- Suspension
		SuspensionForce       = 3.18,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.62,
		SuspensionUpperLimit  = 0.066,
		SuspensionLowerLimit  = -0.13,
		SuspensionRaise		  = -0.0101,
		SuspensionBiasFront   = 0.415,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.355,
		RollCentreHeightRear  = 0.343,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 95000,
		ModelFlags		= '000010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "TYRUS",
		-- Physical
		Mass               = 970,
		InitialDragCoeff   = 1.57,
		DownforceModifier  = 2.21,
		PercentSubmerged   = 68,
		CentreOfMassOffset = { 0,    -0.241, 0.035 },
		InertiaMultiplier  = { 1.101, 1.01,    1.401 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.431,
		DriveInertia                   = 0.95,
		ClutchChangeRateScaleUpShift   = 2.3,
		ClutchChangeRateScaleDownShift = 2.7,
		InitialDriveMaxFlatVel         = 210,
		SteeringLock                   = 32.1,

		-- Brake
		BrakeForce     = 1.444,
		BrakeBiasFront = 0.38949,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.27,
		TractionCurveMin         = 1.974,
		TractionCurveLateral	 = 16.4,
		TractionSpringDeltaMax   = 0.113,
		LowSpeedTractionLossMult = 0.68,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 1.38,

		-- Suspension
		SuspensionForce       = 3.47,
		SuspensionCompDamp    = 1.28,
		SuspensionReboundDamp = 0.59,
		SuspensionUpperLimit  = 0.0581,
		SuspensionLowerLimit  = -0.111,
		SuspensionRaise		  = 0.0102,
		SuspensionBiasFront   = 0.4695,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.8,
		RollCentreHeightFront = 0.1945,
		RollCentreHeightRear  = 0.1925,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.15,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 35000,
		ModelFlags		= '440000',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "VACCA",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 1.35,
		DownforceModifier  = 1.53,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.229, 0.02 },
		InertiaMultiplier  = { 1.15, 1.03,    1.43 },

		-- Transmission
		DriveBiasFront                 = 0.175,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.341,
		DriveInertia                   = 0.96,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 211,
		SteeringLock                   = 34.3,

		-- Brake
		BrakeForce     = 0.88,
		BrakeBiasFront = 0.43438,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.06,
		TractionCurveMin         = 1.68,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.128,
		LowSpeedTractionLossMult = 0.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4836,
		TractionLossMult         = 1.10,

		-- Suspension
		SuspensionForce       = 3.15,
		SuspensionCompDamp    = 1.21,
		SuspensionReboundDamp = 0.445,
		SuspensionUpperLimit  = 0.0919,
		SuspensionLowerLimit  = -0.133,
		SuspensionRaise		  = -0.0465,
		SuspensionBiasFront   = 0.4277,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.386,
		RollCentreHeightRear  = 0.384,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 85000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.045,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25
			}
		}
	},
	CHandlingData {
		
		HandlingName = "VOLTIC",
		-- Physical
		Mass               = 1250,
		InitialDragCoeff   = 8.8,
		DownforceModifier  = 1.46,
		PercentSubmerged   = 70,
		CentreOfMassOffset = { 0,    -0.121, 0.01 },
		InertiaMultiplier  = { 1.13, 0.99,    2.24 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 1,
		InitialDriveForce              = 0.490,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 2.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 1.221,
		BrakeBiasFront = 0.48885,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.23,
		TractionCurveMin         = 2.071,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.128,
		LowSpeedTractionLossMult = 0.23,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4872,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 2.92,
		SuspensionCompDamp    = 1.31,
		SuspensionReboundDamp = 0.57,
		SuspensionUpperLimit  = 0.106,
		SuspensionLowerLimit  = -0.126,
		SuspensionRaise		  = -0.022,
		SuspensionBiasFront   = 0.4701,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.425,
		RollCentreHeightRear  = 0.423,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
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
		
		HandlingName = "PROTOTIPO",
		-- Physical
		Mass               = 1030,
		InitialDragCoeff   = 2.24,
		PercentSubmerged   = 70,
		CentreOfMassOffset = { 0,    -0.261, 0.02 },
		InertiaMultiplier  = { 1.08, 0.93,    1.18 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.531,
		DriveInertia                   = 0.94,
		ClutchChangeRateScaleUpShift   = 6.6,
		ClutchChangeRateScaleDownShift = 6.0,
		InitialDriveMaxFlatVel         = 258,
		SteeringLock                   = 32.5,

		-- Brake
		BrakeForce     = 0.702,
		BrakeBiasFront = 0.38233,
		HandBrakeForce = 0.71,

		-- Traction
		TractionCurveMax         = 2.29,
		TractionCurveMin         = 2.081,
		TractionCurveLateral	 = 16.3,
		TractionSpringDeltaMax   = 0.125,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4829,
		TractionLossMult         = 1.38,

		-- Suspension
		SuspensionForce       = 3.65,
		SuspensionCompDamp    = 0.87,
		SuspensionReboundDamp = 1.21,
		SuspensionUpperLimit  = 0.0681,
		SuspensionLowerLimit  = -0.109,
		SuspensionRaise		  = 0.0096,
		SuspensionBiasFront   = 0.4495,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.233,
		RollCentreHeightRear  = 0.228,

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
		MonetaryValue   = 350000,
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
		
		HandlingName = "ZENTORNO",
		-- Physical
		Mass               = 1000,
		InitialDragCoeff   = 2.95,
		DownforceModifier  = 2.12,
		PercentSubmerged   = 68,
		CentreOfMassOffset = { 0,    -0.243, 0.01 },
		InertiaMultiplier  = { 1.14, 0.99,    2.24 },

		-- Transmission
		DriveBiasFront                 = 0.161,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.405,
		DriveInertia                   = 0.98,
		ClutchChangeRateScaleUpShift   = 2.5,
		ClutchChangeRateScaleDownShift = 2.6,
		InitialDriveMaxFlatVel         = 227,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.662,
		BrakeBiasFront = 0.4336,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.19,
		TractionCurveMin         = 1.992,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.127,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.482,
		TractionLossMult         = 1.33,

		-- Suspension
		SuspensionForce       = 3.32,
		SuspensionCompDamp    = 1.26,
		SuspensionReboundDamp = 0.57,
		SuspensionUpperLimit  = 0.0685,
		SuspensionLowerLimit  = -0.131,
		SuspensionRaise		  = 0.002,
		SuspensionBiasFront   = 0.4494,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.484,
		RollCentreHeightRear  = 0.469,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,
		
		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 350000,
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