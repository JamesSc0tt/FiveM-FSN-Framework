-- Compact Cars
return {
	CHandlingData {
		HandlingName = "BLISTA",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.24,
		DownforceModifier  = 1.29,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.048, -0.251 },
		InertiaMultiplier  = { 1.18, 1,    1.65 },

		-- Transmission
		DriveBiasFront                 = 1,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.2398,
		DriveInertia                   = 0.88,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 135,
		SteeringLock                   = 32.3,

		-- Brake
		BrakeForce     = 0.542,
		BrakeBiasFront = 0.4791,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.81,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.133,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4769,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.4,
		SuspensionCompDamp    = 1.36,
		SuspensionReboundDamp = 0.51,
		SuspensionUpperLimit  = 0.129,
		SuspensionLowerLimit  = -0.137,
		SuspensionRaise		  = -0.013,
		SuspensionBiasFront   = 0.492,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.418,
		RollCentreHeightRear  = 0.401,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.15,
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
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BLISTA2",
		-- Physical
		Mass               = 1050,
		InitialDragCoeff   = 2.15,
		DownforceModifier  = 1.29,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.06, 0.01 },
		InertiaMultiplier  = { 1.16, 1,    1.46 },

		-- Transmission
		DriveBiasFront                 = 0.99,
		InitialDriveGears              = 7,
		InitialDriveForce              = 0.259,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 130,
		SteeringLock                   = 32.4,

		-- Brake
		BrakeForce     = 0.581,
		BrakeBiasFront = 0.5172,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.96,
		TractionCurveMin         = 1.84,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.131,
		LowSpeedTractionLossMult = 0.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4778,
		TractionLossMult         = 0.0,
		
		-- Suspension
		SuspensionForce       = 2.75,
		SuspensionCompDamp    = 1.36,
		SuspensionReboundDamp = 0.46,
		SuspensionUpperLimit  = 0.108,
		SuspensionLowerLimit  = -0.129,
		SuspensionRaise		  = -0.023,
		SuspensionBiasFront   = 0.483,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.333,
		RollCentreHeightRear  = 0.296,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = -0.25,
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
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BRIOSO",
		-- Physical
		Mass               = 980,
		InitialDragCoeff   = 2.21,
		DownforceModifier  = 1.38,
		PercentSubmerged   = 76,
		CentreOfMassOffset = { 0,    -0.045, 0.22 },
		InertiaMultiplier  = { 1.13, 0.99,    1.56 },

		-- Transmission
		DriveBiasFront                 = 1,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.218,
		DriveInertia                   = 1.04,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 125,
		SteeringLock                   = 32.4,

		-- Brake
		BrakeForce     = 0.591,
		BrakeBiasFront = 0.4948,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.902,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.127,
		LowSpeedTractionLossMult = 1.08,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.481,
		TractionLossMult         = 1.27,

		-- Suspension
		SuspensionForce       = 3.01,
		SuspensionCompDamp    = 1.34,
		SuspensionReboundDamp = 2.8,
		SuspensionUpperLimit  = 0.08,
		SuspensionLowerLimit  = -0.11,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.54,
		AntiRollBarBiasFront  = 0.95,
		RollCentreHeightFront = 0.15,
		RollCentreHeightRear  = 0.14,

		-- Damage
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.25,
				BackEndPopUpMaxDeltaSpeed       = 1.75,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "DILETTANTE", -- Needs work
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.5,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, 0 },
		InertiaMultiplier  = { 1, 1,    1.1 },

		-- Transmission
		DriveBiasFront                 = 1,
		InitialDriveGears              = 1,
		InitialDriveForce              = 0.1,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 32.9,

		-- Brake
		BrakeForce     = 0.515,
		BrakeBiasFront = 0.4121,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.76,
		TractionCurveMin         = 1.63,
		TractionCurveLateral	 = 18.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 0.8,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.48,
		TractionLossMult         = 1,

		-- Suspension
		SuspensionForce       = 1.8,
		SuspensionCompDamp    = 1.1,
		SuspensionReboundDamp = 2.0,
		SuspensionUpperLimit  = 0.11,
		SuspensionLowerLimit  = -0.11,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarBiasFront  = 0.3,
		RollCentreHeightFront = 0.18,
		RollCentreHeightRear  = 0.18,

		-- Damage
		CollisionDamageMult         = 1,
		WeaponDamageMult			= 1,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 45000,
		ModelFlags		= '440010',
		HandlingFlags   = "1000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.05,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ISSI2",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 1.29,
		DownforceModifier  = 1.24,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.185, -0.124 },
		InertiaMultiplier  = { 0.99, 1.04,    1.74 },

		-- Transmission
		DriveBiasFront                 = 1,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.1815,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 135,
		SteeringLock                   = 32.9,

		-- Brake
		BrakeForce     = 0.51,
		BrakeBiasFront = 0.3965,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.83,
		TractionCurveLateral	 = 15.1,
		TractionSpringDeltaMax   = 0.105,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4768,
		TractionLossMult         = 1.17,

		-- Suspension
		SuspensionForce       = 1.78,
		SuspensionCompDamp    = 1.45,
		SuspensionReboundDamp = 0.38,
		SuspensionUpperLimit  = 0.145,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.43,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.457,
		RollCentreHeightRear  = 0.44,

		-- Damage
		CollisionDamageMult         = 1,
		WeaponDamageMult			= 1,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.06,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "PANTO",
		-- Physical
		Mass               = 950,
		InitialDragCoeff   = 2.72,
		DownforceModifier  = 1.19,
		PercentSubmerged   = 82,
		CentreOfMassOffset = { 0,    0.088, -0.052 },
		InertiaMultiplier  = { 0.97, 0.99,    1.88 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.2297,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 2.4,
		ClutchChangeRateScaleDownShift = 2.8,
		InitialDriveMaxFlatVel         = 139,
		SteeringLock                   = 30,

		-- Brake
		BrakeForce     = 0.19,
		BrakeBiasFront = 0.5521,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 2.25,
		TractionCurveMin         = 1.99,
		TractionCurveLateral	 = 15,
		TractionSpringDeltaMax   = 0.09,
		LowSpeedTractionLossMult = 1.09,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.47001,
		TractionLossMult         = 1.14,

		-- Suspension
		SuspensionForce       = 2.45,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 0.45,
		SuspensionUpperLimit  = 0.109,
		SuspensionLowerLimit  = -0.13,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5595,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.13,
		RollCentreHeightRear  = 0.14,

		-- Damage
		CollisionDamageMult         = 1,
		WeaponDamageMult			= 1,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000000",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.06,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "PRAIRIE",
		-- Physical
		Mass               = 1400,
		InitialDragCoeff   = 2.03,
		DownforceModifier  = 1.34,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.133, 0.005 },
		InertiaMultiplier  = { 1.17, 1,    1.71 },

		-- Transmission
		DriveBiasFront                 = 1,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.245,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 33,

		-- Brake
		BrakeForce     = 0.5235,
		BrakeBiasFront = 0.4633,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.01,
		TractionCurveMin         = 1.91,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.1387,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4765,
		TractionLossMult         = 1.24,

		-- Suspension
		SuspensionForce       = 2.42,
		SuspensionCompDamp    = 1.43,
		SuspensionReboundDamp = 0.45,
		SuspensionUpperLimit  = 0.125,
		SuspensionLowerLimit  = -0.133,
		SuspensionRaise		  = -0.008,
		SuspensionBiasFront   = 0.3895,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.451,
		RollCentreHeightRear  = 0.419,

		-- Damage
		CollisionDamageMult         = 1,
		WeaponDamageMult			= 1,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60,
		OilVolume					= 5,

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
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
	CHandlingData {
		
		HandlingName = "RHAPSODY",
		-- Physical
		Mass               = 1350,
		InitialDragCoeff   = 1.99,
		DownforceModifier  = 1.05,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0.24, -0.071 },
		InertiaMultiplier  = { 0.99, 104,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.23,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 125,
		SteeringLock                   = 33.7,

		-- Brake
		BrakeForce     = 0.474,
		BrakeBiasFront = 0.6741,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.84,
		TractionCurveLateral	 = 14.8,
		TractionSpringDeltaMax   = 0.11,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4818,
		TractionLossMult         = 1.22,

		-- Suspension
		SuspensionForce       = 1.55,
		SuspensionCompDamp    = 1.8,
		SuspensionReboundDamp = 0.29,
		SuspensionUpperLimit  = 0.15,
		SuspensionLowerLimit  = -0.1,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.615,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.43,
		RollCentreHeightRear  = 0.44,

		-- Damage
		CollisionDamageMult         = 1,
		WeaponDamageMult			= 1,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60,
		OilVolume					= 5,

		-- Misc
		SeatOffsetDistX = 0.02,
		SeatOffsetDistY = -0.18,
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000000",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6,
			}
		}
	},
}