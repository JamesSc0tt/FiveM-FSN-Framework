-- SUVs 
return {
	CHandlingData {
		HandlingName = "BALLER",
		-- Physical
		Mass               = 2600,
		InitialDragCoeff   = 1.41,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.08, 0.04 },
		InertiaMultiplier  = { 1.16, 1,    1.41 },

		-- Transmission
		DriveBiasFront                 = 0.25,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.204,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.514,
		BrakeBiasFront = 0.50561,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.67,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4851,
		TractionLossMult         = 1.15,

		-- Suspension
		SuspensionForce       = 2.08,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.4389,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.17,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.471,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.789,
		RollCentreHeightRear  = 0.789,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 8.0,

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
		
		HandlingName = "BALLER3",
		-- Physical
		Mass               = 2200,
		InitialDragCoeff   = 1.658,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.13, 0.04 },
		InertiaMultiplier  = { 1.16, 1,    1.41 },

		-- Transmission
		DriveBiasFront                 = 0.24,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.235,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 34.6,

		-- Brake
		BrakeForce     = 0.423,
		BrakeBiasFront = 0.48231,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.71,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.137,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4846,
		TractionLossMult         = 1.14,

		-- Suspension
		SuspensionForce       = 2.1204,
		SuspensionCompDamp    = 1.45,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.157,
		SuspensionLowerLimit  = -0.174,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.469,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.56,
		RollCentreHeightFront = 0.789,
		RollCentreHeightRear  = 0.788,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 8.0,

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
				BackEndPopUpCarImpulseMult      = 0.06,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BALLER4",
		-- Physical
		Mass               = 2300,
		InitialDragCoeff   = 1.5925,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.42, 0.04 },
		InertiaMultiplier  = { 1.16, 1,    1.44 },

		-- Transmission
		DriveBiasFront                 = 0.24,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.2595,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 175,
		SteeringLock                   = 35.2,

		-- Brake
		BrakeForce     = 0.418,
		BrakeBiasFront = 0.46049,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.97,
		TractionCurveMin         = 1.8,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4852,
		TractionLossMult         = 1.14,

		-- Suspension
		SuspensionForce       = 2.22,
		SuspensionCompDamp    = 1.41,
		SuspensionReboundDamp = 0.45,
		SuspensionUpperLimit  = 0.159,
		SuspensionLowerLimit  = -0.176,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.435,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.62,
		RollCentreHeightFront = 0.788,
		RollCentreHeightRear  = 0.788,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 8.0,

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
				BackEndPopUpCarImpulseMult      = 0.04,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "BJXL",
		-- Physical
		Mass               = 2300,
		InitialDragCoeff   = 1.2135,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.08, 0.04 },
		InertiaMultiplier  = { 1.16, 1,    1.63 },

		-- Transmission
		DriveBiasFront                 = 0.28,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.2399,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.3,
		ClutchChangeRateScaleDownShift = 1.3,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 34.8,

		-- Brake
		BrakeForce     = 0.498,
		BrakeBiasFront = 0.528,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.7,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4861,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 1.99,
		SuspensionCompDamp    = 1.75,
		SuspensionReboundDamp = 0.38,
		SuspensionUpperLimit  = 0.156,
		SuspensionLowerLimit  = -0.165,
		SuspensionRaise		  = 0.007,
		SuspensionBiasFront   = 0.494,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.66,
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
		
		HandlingName = "CAVALCADE", -- No Handling
		-- Physical
		Mass               = 2600,
		InitialDragCoeff   = 2.91,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.08, 0.04 },
		InertiaMultiplier  = { 1.16, 1,    1.41 },

		-- Transmission
		DriveBiasFront                 = 0.25,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.204,
		DriveInertia                   = 1,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.514,
		BrakeBiasFront = 0.50561,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.67,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4851,
		TractionLossMult         = 1.15,

		-- Suspension
		SuspensionForce       = 2.08,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.4389,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.17,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.471,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.789,
		RollCentreHeightRear  = 0.789,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 8.0,

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
		
		HandlingName = "CAVALCADE2", --No Handling
		-- Physical
		Mass               = 2600,
		InitialDragCoeff   = 1.91,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.08, 0.04 },
		InertiaMultiplier  = { 1.16, 1,    1.41 },

		-- Transmission
		DriveBiasFront                 = 0.25,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.204,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 145,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.514,
		BrakeBiasFront = 0.50561,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.9,
		TractionCurveMin         = 1.67,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4851,
		TractionLossMult         = 1.15,

		-- Suspension
		SuspensionForce       = 2.08,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.4389,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.17,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.471,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.789,
		RollCentreHeightRear  = 0.789,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 8.0,

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
		
		HandlingName = "DUBSTA",
		-- Physical
		Mass               = 2600,
		InitialDragCoeff   = 1.91,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.11, 0.19 },
		InertiaMultiplier  = { 1.18, 1,    1.71 },

		-- Transmission
		DriveBiasFront                 = 0.265,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.319,
		DriveInertia                   = 1.09,
		ClutchChangeRateScaleUpShift   = 2,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 163,
		SteeringLock                   = 34.6,

		-- Brake
		BrakeForce     = 0.521,
		BrakeBiasFront = 0.5029,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.93,
		TractionCurveMin         = 1.79,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4851,
		TractionLossMult         = 1.04,

		-- Suspension
		SuspensionForce       = 1.6,
		SuspensionCompDamp    = 1,
		SuspensionReboundDamp = 1.6,
		SuspensionUpperLimit  = 0.1,
		SuspensionLowerLimit  = -0.24,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.52,
		AntiRollBarForce	  = 0.6,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.4,
		RollCentreHeightRear  = 0.4,

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
		SeatOffsetDistZ = 0.05,
		MonetaryValue   = 50000,
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
		
		HandlingName = "FQ2",
		-- Physical
		Mass               = 2200,
		InitialDragCoeff   = 1.91,
		DownforceModifier  = 1.22,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.08, 0.04 },
		InertiaMultiplier  = { 1.18, 1,    1.46 },

		-- Transmission
		DriveBiasFront                 = 0.23,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.199964,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 151,
		SteeringLock                   = 34.6,

		-- Brake
		BrakeForce     = 0.521,
		BrakeBiasFront = 0.5029,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.77,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4814,
		TractionLossMult         = 1.12,

		-- Suspension
		SuspensionForce       = 2.31,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.16,
		SuspensionLowerLimit  = -0.165,
		SuspensionRaise		  = 0.008,
		SuspensionBiasFront   = 0.491,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.52,
		RollCentreHeightFront = 0.489,
		RollCentreHeightRear  = 0.489,

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
		MonetaryValue   = 45000,
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
		
		HandlingName = "GRANGER",
		-- Physical
		Mass               = 1950,
		InitialDragCoeff   = 2.53,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.081, 0.04 },
		InertiaMultiplier  = { 1.15, 1,    1.42 },

		-- Transmission
		DriveBiasFront                 = 0.27,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.199,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 142,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.415,
		BrakeBiasFront = 0.4842,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.97,
		TractionCurveMin         = 1.72,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.134,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4861,
		TractionLossMult         = 1.14,

		-- Suspension
		SuspensionForce       = 1.92,
		SuspensionCompDamp    = 1.55,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.15,
		SuspensionLowerLimit  = -0.153,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.496,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.42,
		RollCentreHeightRear  = 0.42,

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
				BackEndPopUpCarImpulseMult      = 0.06,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "HUNTLEY",
		-- Physical
		Mass               = 2900,
		InitialDragCoeff   = 2.364,
		DownforceModifier  = 1.18,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.11, 0.34 },
		InertiaMultiplier  = { 1.21, 1,    1.78 },

		-- Transmission
		DriveBiasFront                 = 0.205,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.229,
		DriveInertia                   = 0.96,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 1.8,
		InitialDriveMaxFlatVel         = 160,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.532,
		BrakeBiasFront = 0.4906,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.76,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.139,
		LowSpeedTractionLossMult = 1.11,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4832,
		TractionLossMult         = 1.14,

		-- Suspension
		SuspensionForce       = 2.29,
		SuspensionCompDamp    = 1.35,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.153,
		SuspensionLowerLimit  = -0.163,
		SuspensionRaise		  = -0.005,
		SuspensionBiasFront   = 0.461,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.514,
		RollCentreHeightRear  = 0.514,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.15,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
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
		
		HandlingName = "LANDSTALKER",
		-- Physical
		Mass               = 2700,
		InitialDragCoeff   = 2.251,
		DownforceModifier  = 1.18,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.18, 0.04 },
		InertiaMultiplier  = { 1.18, 1,    1.73 },

		-- Transmission
		DriveBiasFront                 = 0.22,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.214,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 152,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.525,
		BrakeBiasFront = 0.45765,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.71,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.141,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4846,
		TractionLossMult         = 1.13,

		-- Suspension
		SuspensionForce       = 2.38,
		SuspensionCompDamp    = 1.48,
		SuspensionReboundDamp = 0.156,
		SuspensionUpperLimit  = 0.156,
		SuspensionLowerLimit  = -0.158,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.431,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.5,
		RollCentreHeightFront = 0.351,
		RollCentreHeightRear  = 0.352,

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
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "PATRIOT",
		-- Physical
		Mass               = 3100,
		InitialDragCoeff   = 2.88,
		PercentSubmerged   = 82,
		CentreOfMassOffset = { 0,    -0.03, 0.08 },
		InertiaMultiplier  = { 1.15, 1,    1.53 },

		-- Transmission
		DriveBiasFront                 = 0.31,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.1996,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 152,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.495,
		BrakeBiasFront = 0.5167,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.75,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.139,
		LowSpeedTractionLossMult = 1.18,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4846,
		TractionLossMult         = 0.87,

		-- Suspension
		SuspensionForce       = 1.97,
		SuspensionCompDamp    = 1.78,
		SuspensionReboundDamp = 0.45,
		SuspensionUpperLimit  = 0.175,
		SuspensionLowerLimit  = -0.261,
		SuspensionRaise		  = -0.016,
		SuspensionBiasFront   = 0.486,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.535,
		RollCentreHeightRear  = 0.535,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 50000,
		ModelFlags		= '220040',
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
		
		HandlingName = "PATRIOT2",
		-- Physical
		Mass               = 3600,
		InitialDragCoeff   = 2.88,
		PercentSubmerged   = 82,
		CentreOfMassOffset = { 0,    -0.03, 0.08 },
		InertiaMultiplier  = { 1.15, 1,    1.53 },

		-- Transmission
		DriveBiasFront                 = 0.31,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.1686,
		DriveInertia                   = 0.9,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 132,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.495,
		BrakeBiasFront = 0.5167,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.65,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.139,
		LowSpeedTractionLossMult = 1.18,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4846,
		TractionLossMult         = 1.07,

		-- Suspension
		SuspensionForce       = 1.97,
		SuspensionCompDamp    = 1.78,
		SuspensionReboundDamp = 0.45,
		SuspensionUpperLimit  = 0.175,
		SuspensionLowerLimit  = -0.261,
		SuspensionRaise		  = -0.016,
		SuspensionBiasFront   = 0.486,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.535,
		RollCentreHeightRear  = 0.535,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.4,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.1,
		SeatOffsetDistY = -0.2,
		SeatOffsetDistZ = -0.1,
		MonetaryValue   = 50000,
		ModelFlags		= '220040',
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
		
		HandlingName = "RADI",
		-- Physical
		Mass               = 2100,
		InitialDragCoeff   = 2.304,
		DownforceModifier  = 1.14,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.101, 0.04 },
		InertiaMultiplier  = { 1.18, 1,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0.22,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.196,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.6,
		ClutchChangeRateScaleDownShift = 1.6,
		InitialDriveMaxFlatVel         = 148,
		SteeringLock                   = 34.6,

		-- Brake
		BrakeForce     = 0.409,
		BrakeBiasFront = 0.50089,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.95,
		TractionCurveMin         = 1.81,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.139,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4803,
		TractionLossMult         = 1.12,

		-- Suspension
		SuspensionForce       = 2.34,
		SuspensionCompDamp    = 1.52,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.154,
		SuspensionLowerLimit  = -0.169,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.481,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.50,
		RollCentreHeightFront = 0.393,
		RollCentreHeightRear  = 0.393,

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
				BackEndPopUpCarImpulseMult      = 0.07,
				BackEndPopUpBuildingImpulseMult = 0.03,
				BackEndPopUpMaxDeltaSpeed       = 0.6
			}
		}
	},
	CHandlingData {
		
		HandlingName = "ROCOTO",
		-- Physical
		Mass               = 2400,
		InitialDragCoeff   = 2.82,
		DownforceModifier  = 1.26,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    -0.15, 0.04 },
		InertiaMultiplier  = { 1.18, 1,    1.54 },

		-- Transmission
		DriveBiasFront                 = 0.22,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.227,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 158,
		SteeringLock                   = 34.4,

		-- Brake
		BrakeForce     = 0.431,
		BrakeBiasFront = 0.449,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.98,
		TractionCurveMin         = 1.737,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.141,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4845,
		TractionLossMult         = 1.15,

		-- Suspension
		SuspensionForce       = 2.44,
		SuspensionCompDamp    = 1.46,
		SuspensionReboundDamp = 0.49,
		SuspensionUpperLimit  = 0.161,
		SuspensionLowerLimit  = -0.17,
		SuspensionRaise		  = -0.011,
		SuspensionBiasFront   = 0.443,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.721,
		RollCentreHeightRear  = 0.721,

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
		
		HandlingName = "SEMINOLE",
		-- Physical
		Mass               = 2200,
		InitialDragCoeff   = 2.8,
		PercentSubmerged   = 82,
		CentreOfMassOffset = { 0,    -0.11, 0.05 },
		InertiaMultiplier  = { 1.18, 1,    1.52 },

		-- Transmission
		DriveBiasFront                 = 0.24,
		InitialDriveGears              = 5,
		InitialDriveForce              = 0.202,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.4,
		ClutchChangeRateScaleDownShift = 1.4,
		InitialDriveMaxFlatVel         = 150,
		SteeringLock                   = 34.6,

		-- Brake
		BrakeForce     = 0.406,
		BrakeBiasFront = 0.49278,
		HandBrakeForce = 0.75,

		-- Traction
		TractionCurveMax         = 1.94,
		TractionCurveMin         = 1.751,
		TractionCurveLateral	 = 16.6,
		TractionSpringDeltaMax   = 0.141,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.98,
		TractionBiasFront        = 0.4852,
		TractionLossMult         = 0.98,

		-- Suspension
		SuspensionForce       = 2.21,
		SuspensionCompDamp    = 1.58,
		SuspensionReboundDamp = 0.42,
		SuspensionUpperLimit  = 0.159,
		SuspensionLowerLimit  = -0.211,
		SuspensionRaise		  = 0.0,
		SuspensionBiasFront   = 0.476,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.54,
		RollCentreHeightFront = 0.309,
		RollCentreHeightRear  = 0.309,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.1,
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
		
		HandlingName = "XLS",
		-- Physical
		Mass               = 2500,
		InitialDragCoeff   = 2.56,
		DownforceModifier  = 1.05,
		PercentSubmerged   = 78,
		CentreOfMassOffset = { 0,    -0.22, 0.02 },
		InertiaMultiplier  = { 1.18, 0.96,    1.18 },

		-- Transmission
		DriveBiasFront                 = 0.24,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.247,
		DriveInertia                   = 1.0,
		ClutchChangeRateScaleUpShift   = 1.7,
		ClutchChangeRateScaleDownShift = 1.7,
		InitialDriveMaxFlatVel         = 172,
		SteeringLock                   = 33.9,

		-- Brake
		BrakeForce     = 0.538,
		BrakeBiasFront = 0.4980,
		HandBrakeForce = 0.8,

		-- Traction
		TractionCurveMax         = 1.96,
		TractionCurveMin         = 1.798,
		TractionCurveLateral	 = 16.7,
		TractionSpringDeltaMax   = 0.138,
		LowSpeedTractionLossMult = 1.19,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4829,
		TractionLossMult         = 1.0,

		-- Suspension
		SuspensionForce       = 2.41,
		SuspensionCompDamp    = 1.45,
		SuspensionReboundDamp = 0.44,
		SuspensionUpperLimit  = 0.118,
		SuspensionLowerLimit  = -0.161,
		SuspensionRaise		  = -0.04,
		SuspensionBiasFront   = 0.477,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.56,
		RollCentreHeightFront = 0.682,
		RollCentreHeightRear  = 0.681,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.8,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 80.0,
		OilVolume					= 8.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = -0.1,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 50000,
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