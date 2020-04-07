-- Sports Classic Cars
return {
	CHandlingData {
		HandlingName = "BTYPE",
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.95,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.15, -0.096 },
		InertiaMultiplier  = { 0.99, 1.07,    1.06 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.246,
		DriveInertia                   = 1.27,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 149,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.482,
		BrakeBiasFront = 0.5849,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.79,
		TractionCurveLateral	 = 14.9,
		TractionSpringDeltaMax   = 0.105,
		LowSpeedTractionLossMult = 1.39,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.4,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.098,
		SuspensionLowerLimit  = -0.125,
		SuspensionRaise		  = 0.018,
		SuspensionBiasFront   = 0.575,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.49,
		RollCentreHeightFront = 0,
		RollCentreHeightRear  = 0,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = -0.1,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 70000,
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
		
		HandlingName = "BTYPE2",
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.95,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.15, -0.096 },
		InertiaMultiplier  = { 0.99, 1.07,    1.06 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.206,
		DriveInertia                   = 0.87,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 139,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.392,
		BrakeBiasFront = 0.5849,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.76,
		TractionCurveLateral	 = 14.9,
		TractionSpringDeltaMax   = 0.105,
		LowSpeedTractionLossMult = 1.17,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.4,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.098,
		SuspensionLowerLimit  = -0.125,
		SuspensionRaise		  = 0.018,
		SuspensionBiasFront   = 0.575,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.49,
		RollCentreHeightFront = 0,
		RollCentreHeightRear  = 0,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = -0.1,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 70000,
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
		
		HandlingName = "BTYPE3", -- No Handling
		-- Physical
		Mass               = 2000,
		InitialDragCoeff   = 2.95,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.15, -0.096 },
		InertiaMultiplier  = { 0.99, 1.07,    1.06 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.206,
		DriveInertia                   = 0.87,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 139,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.392,
		BrakeBiasFront = 0.5849,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.76,
		TractionCurveLateral	 = 14.9,
		TractionSpringDeltaMax   = 0.105,
		LowSpeedTractionLossMult = 1.17,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 1.26,

		-- Suspension
		SuspensionForce       = 2.4,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.098,
		SuspensionLowerLimit  = -0.125,
		SuspensionRaise		  = 0.018,
		SuspensionBiasFront   = 0.575,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.49,
		RollCentreHeightFront = 0,
		RollCentreHeightRear  = 0,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = -0.1,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 70000,
		ModelFlags		= '440010',
		HandlingFlags   = "0820100",
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
		
		HandlingName = "CASCO",
		-- Physical
		Mass               = 1450,
		InitialDragCoeff   = 2.97,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.15, 0.112 },
		InertiaMultiplier  = { 1, 1.06,    1.85 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.276,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 154,
		SteeringLock                   = 33.6,

		-- Brake
		BrakeForce     = 0.57,
		BrakeBiasFront = 0.60203,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.84,
		TractionCurveLateral	 = 14.4,
		TractionSpringDeltaMax   = 0.126,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4802,
		TractionLossMult         = 1.17,

		-- Suspension
		SuspensionForce       = 1.55,
		SuspensionCompDamp    = 1.8,
		SuspensionReboundDamp = 0.3,
		SuspensionUpperLimit  = 0.163,
		SuspensionLowerLimit  = -0.151,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.528,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.1,
		RollCentreHeightRear  = 0.1,

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
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 130000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.065,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25
			}
		}
	},
	CHandlingData {
		
		HandlingName = "COQUETTE2",
		-- Physical
		Mass               = 1550,
		InitialDragCoeff   = 2.201,
		DownforceModifier  = 1.22,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.165, -0.027 },
		InertiaMultiplier  = { 0.99, 1.02,    1.36 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.3,
		DriveInertia                   = 0.88,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 152,
		SteeringLock                   = 33.1,

		-- Brake
		BrakeForce     = 0.511,
		BrakeBiasFront = 0.47624,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 2.09,
		TractionCurveMin         = 1.9,
		TractionCurveLateral	 = 14.1,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4699,
		TractionLossMult         = 1.16,

		-- Suspension
		SuspensionForce       = 1.68,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.119,
		SuspensionLowerLimit  = -0.163,
		SuspensionRaise		  = 0.009,
		SuspensionBiasFront   = 0.548,
		AntiRollBarBiasFront  = 0.63,
		RollCentreHeightFront = 0.08,
		RollCentreHeightRear  = 0.1,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
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
				BackEndPopUpCarImpulseMult      = 0.06,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "COQUETTE3",
		-- Physical
		Mass               = 1450,
		InitialDragCoeff   = 2.07,
		DownforceModifier  = 1.13,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.075, -0.128 },
		InertiaMultiplier  = { 1.15, 1,    1.2 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.25,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 3.0,
		InitialDriveMaxFlatVel         = 166,
		SteeringLock                   = 34.2,

		-- Brake
		BrakeForce     = 0.501,
		BrakeBiasFront = 0.5598,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.86,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.12,
		LowSpeedTractionLossMult = 1.08,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4842,
		TractionLossMult         = 1.28,

		-- Suspension
		SuspensionForce       = 1.8,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 0.32,
		SuspensionUpperLimit  = 0.112,
		SuspensionLowerLimit  = -0.145,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.52,
		AntiRollBarBiasFront  = 0,
		AntiRollBarBiasFront  = 0.63,
		RollCentreHeightFront = 0.14,
		RollCentreHeightRear  = 0.16,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
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
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "HERMES",
		-- Physical
		Mass               = 1300,
		InitialDragCoeff   = 2.2,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, 0 },
		InertiaMultiplier  = { 1.2, 1.4,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.29,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.55,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.25,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.82,
		TractionCurveLateral	 = 17.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.49,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 1.2,
		SuspensionReboundDamp = 1.3,
		SuspensionUpperLimit  = 0.14,
		SuspensionLowerLimit  = -0.18,
		SuspensionRaise		  = 0.15,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.6,
		AntiRollBarBiasFront  = 0.65,
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
		ModelFlags		= '80440040',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
	CHandlingData {
		
		HandlingName = "JB700",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 3.6,
		DownforceModifier  = 1.22,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.155, -0.015 },
		InertiaMultiplier  = { 0.99, 0.99,    1.58 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.28,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 33.3,

		-- Brake
		BrakeForce     = 0.58,
		BrakeBiasFront = 0.5677,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.8,
		TractionCurveLateral	 = 14.3,
		TractionSpringDeltaMax   = 0.09,
		LowSpeedTractionLossMult = 1.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4728,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 1.75,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 0.3,
		SuspensionUpperLimit  = 0.145,
		SuspensionLowerLimit  = -0.15,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.521,
		AntiRollBarForce	  = 1.0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.38,
		RollCentreHeightRear  = 0.4,

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
		MonetaryValue   = 150000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.075,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25
			}
		}
	},
	CHandlingData {
		
		HandlingName = "MAMBA",
		-- Physical
		Mass               = 1200,
		InitialDragCoeff   = 2.41,
		DownforceModifier  = 1.57,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.105, -0.108 },
		InertiaMultiplier  = { 1.01, 1.05,    1.35 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.31,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.35,
		ClutchChangeRateScaleDownShift = 1.9,
		InitialDriveMaxFlatVel         = 148,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.506,
		BrakeBiasFront = 0.55949,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.89,
		TractionCurveMin         = 1.77,
		TractionCurveLateral	 = 14.7,
		TractionSpringDeltaMax   = 0.11,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4823,
		TractionLossMult         = 1.1,

		-- Suspension
		SuspensionForce       = 2.2,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 2.5,
		SuspensionUpperLimit  = 0.06,
		SuspensionLowerLimit  = -0.08,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.57,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.68,
		RollCentreHeightFront = 0.08,
		RollCentreHeightRear  = 0.09,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = -0.05,
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
		
		HandlingName = "PIGALLE",
		-- Physical
		Mass               = 1600,
		InitialDragCoeff   = 2.82,
		DownforceModifier  = 1.19,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.095, -0.09 },
		InertiaMultiplier  = { 1.19, 1.02,    1.61 },

		-- Transmission
		DriveBiasFront                 = 1.0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.1875,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 128,
		SteeringLock                   = 32.4,

		-- Brake
		BrakeForce     = 0.552,
		BrakeBiasFront = 0.4288,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 2.21,
		TractionCurveMin         = 1.91,
		TractionCurveLateral	 = 16.8,
		TractionSpringDeltaMax   = 0.139,
		LowSpeedTractionLossMult = 1.21,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4768,
		TractionLossMult         = 1.31,

		-- Suspension
		SuspensionForce       = 2.38,
		SuspensionCompDamp    = 1.58,
		SuspensionReboundDamp = 0.36,
		SuspensionUpperLimit  = 0.14,
		SuspensionLowerLimit  = -0.133,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.433,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.3,
		RollCentreHeightFront = 0.236,
		RollCentreHeightRear  = 0.211,

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
		
		HandlingName = "RAPIDGT3",
		-- Physical
		Mass               = 1850,
		InitialDragCoeff   = 2.73,
		DownforceModifier  = 1.35,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    0, -0.22 },
		InertiaMultiplier  = { 1.17, 1,    1.73 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.315,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 155,
		SteeringLock                   = 32.4,

		-- Brake
		BrakeForce     = 0.575,
		BrakeBiasFront = 0.49252,
		HandBrakeForce = 1.0,

		-- Traction
		TractionCurveMax         = 2.1,
		TractionCurveMin         = 1.944,
		TractionCurveLateral	 = 17.0,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 0.89,
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
		CollisionDamageMult         = 0.7,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 0.7,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.025,
		SeatOffsetDistY = -0.175,
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
		
		HandlingName = "STINGER",
		-- Physical
		Mass               = 1300,
		InitialDragCoeff   = 2.5,
		DownforceModifier  = 1.22,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.29, -0.0598 },
		InertiaMultiplier  = { 0.98, 1.03,    1.26 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.286,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 155,
		SteeringLock                   = 35,

		-- Brake
		BrakeForce     = 0.49,
		BrakeBiasFront = 0.6225,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.84,
		TractionCurveMin         = 1.75,
		TractionCurveLateral	 = 14.5,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4786,
		TractionLossMult         = 1.15,

		-- Suspension
		SuspensionForce       = 1.65,
		SuspensionCompDamp    = 1.6,
		SuspensionReboundDamp = 0.34,
		SuspensionUpperLimit  = 0.128,
		SuspensionLowerLimit  = -0.161,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.63,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
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
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 130000,
		ModelFlags		= '440010',
		HandlingFlags   = "0",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.065,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25
			}
		}
	},
	CHandlingData {
		
		HandlingName = "STINGERGT",
		-- Physical
		Mass               = 1050,
		InitialDragCoeff   = 1.36,
		DownforceModifier  = 1.29,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.201, -0.057 },
		InertiaMultiplier  = { 0.98, 0.99,    1.31 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.331,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 2.1,
		ClutchChangeRateScaleDownShift = 2.2,
		InitialDriveMaxFlatVel         = 153,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.505,
		BrakeBiasFront = 0.6215,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.78,
		TractionCurveLateral	 = 14.3,
		TractionSpringDeltaMax   = 0.095,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4772,
		TractionLossMult         = 1.35,

		-- Suspension
		SuspensionForce       = 1.83,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 0.41,
		SuspensionUpperLimit  = 0.125,
		SuspensionLowerLimit  = -0.151,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.554,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.5,
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
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 130000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.065,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.25
			}
		}
	},
	CHandlingData {
		
		HandlingName = "FELTZER3",
		-- Physical
		Mass               = 1250,
		InitialDragCoeff   = 2.21,
		DownforceModifier  = 1.15,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.11, -0.051 },
		InertiaMultiplier  = { 1.16, 1,    1.18 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.2829,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 143,
		SteeringLock                   = 34,

		-- Brake
		BrakeForce     = 0.506,
		BrakeBiasFront = 0.53695,
		HandBrakeForce = 0.74,

		-- Traction
		TractionCurveMax         = 1.92,
		TractionCurveMin         = 1.8,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.128,
		LowSpeedTractionLossMult = 1.22,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4795,
		TractionLossMult         = 1.24,

		-- Suspension
		SuspensionForce       = 1.98,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 0.35,
		SuspensionUpperLimit  = 0.113,
		SuspensionLowerLimit  = -0.142,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.52,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.06,
		RollCentreHeightRear  = 0.09,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.03,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 30000,
		ModelFlags		= '440010',
		HandlingFlags   = "20000",
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
		
		HandlingName = "TORNADO5",
		-- Physical
		Mass               = 2200,
		InitialDragCoeff   = 2,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0, 0 },
		InertiaMultiplier  = { 1.2, 1.4,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.241,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.5,
		ClutchChangeRateScaleDownShift = 1.5,
		InitialDriveMaxFlatVel         = 140,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.555,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.3,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.82,
		TractionCurveLateral	 = 17.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.1,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.49,
		TractionLossMult         = 1,

		-- Suspension
		SuspensionForce       = 1.6,
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
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = -0.025,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = -0.05,
		MonetaryValue   = 25000,
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
		
		HandlingName = "TORNADO6",
		-- Physical
		Mass               = 2100,
		InitialDragCoeff   = 2,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.2, -0.15 },
		InertiaMultiplier  = { 1.2, 1.4,    1.6 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.52,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 30.0,

		-- Brake
		BrakeForce     = 0.65,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.8,
		TractionCurveMin         = 1.4,
		TractionCurveLateral	 = 17.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.45,
		TractionLossMult         = 1.2,

		-- Suspension
		SuspensionForce       = 1.4,
		SuspensionCompDamp    = 1.2,
		SuspensionReboundDamp = 1.3,
		SuspensionUpperLimit  = 0.08,
		SuspensionLowerLimit  = -0.12,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.8,
		AntiRollBarBiasFront  = 0.35,
		RollCentreHeightFront = 0.36,
		RollCentreHeightRear  = 0.36,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
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
				BackEndPopUpCarImpulseMult      = 0.1,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ZTYPE",
		-- Physical
		Mass               = 1200,
		InitialDragCoeff   = 2.93,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.29, -0.035 },
		InertiaMultiplier  = { 0.99, 1.06,    1.34 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.331,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.15,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 146,
		SteeringLock                   = 36.0,

		-- Brake
		BrakeForce     = 0.58,
		BrakeBiasFront = 0.5311,
		HandBrakeForce = 0.95,

		-- Traction
		TractionCurveMax         = 1.99,
		TractionCurveMin         = 1.88,
		TractionCurveLateral	 = 16.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4775,
		TractionLossMult         = 1.15,

		-- Suspension
		SuspensionForce       = 1.45,
		SuspensionCompDamp    = 1.7,
		SuspensionReboundDamp = 0.28,
		SuspensionUpperLimit  = 0.152,
		SuspensionLowerLimit  = -0.152,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.562,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.19,
		RollCentreHeightRear  = 0.23,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.5,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 70000,
		ModelFlags		= '440010',
		HandlingFlags   = "0820100",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {
				BackEndPopUpCarImpulseMult      = 0.065,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.03
			}
		}
	},
	CHandlingData {
		
		HandlingName = "Z190",
		-- Physical
		Mass               = 1100,
		InitialDragCoeff   = 2.89,
		DownforceModifier  = 1.28,
		PercentSubmerged   = 72,
		CentreOfMassOffset = { 0,    -0.04, 0.01 },
		InertiaMultiplier  = { 0.84, 0.53,    0.85 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.319,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 158,
		SteeringLock                   = 32.8,

		-- Brake
		BrakeForce     = 0.501,
		BrakeBiasFront = 0.44461,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.84,
		TractionCurveLateral	 = 16.9,
		TractionSpringDeltaMax   = 0.141,
		LowSpeedTractionLossMult = 1.01,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4838,
		TractionLossMult         = 1.24,

		-- Suspension
		SuspensionForce       = 2.41,
		SuspensionCompDamp    = 1.17,
		SuspensionReboundDamp = 1.21,
		SuspensionUpperLimit  = 0.081,
		SuspensionLowerLimit  = -0.132,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.37,
		RollCentreHeightFront = 0.252,
		RollCentreHeightRear  = 0.234,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.7,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = -0.08,
		SeatOffsetDistY = -0.07,
		SeatOffsetDistZ = 0.1,
		MonetaryValue   = 130000,
		ModelFlags		= '000000',
		HandlingFlags   = "0820102",
		DamageFlags		= "0",
		AIHandling		= "AVERAGE",
		
		SubHandling = {
			CCarHandlingData {
				
			}
		}
	},
}