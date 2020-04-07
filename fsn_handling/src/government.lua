-- Government Vehicle

  --------------------
  -- LEO Cars
  --------------------
return {
	CHandlingData {
		
		HandlingName = "pbus", -- Prison Bus (111)
		-- Physical
		Mass               = 9000,
		InitialDragCoeff   = 10,
		PercentSubmerged   = 85,
		CentreOfMassOffset = { 0,    0.0, 0.0 },
		InertiaMultiplier  = { 1.2, 1.4,    1.4 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.15,
		DriveInertia                   = 0.6,
		ClutchChangeRateScaleUpShift   = 1.2,
		ClutchChangeRateScaleDownShift = 1.2,
		InitialDriveMaxFlatVel         = 100,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.25,
		BrakeBiasFront = 0.65,
		HandBrakeForce = 0.3,

		-- Traction
		TractionCurveMax         = 1.35,
		TractionCurveMin         = 1.2,
		TractionCurveLateral	 = 35.0,
		TractionSpringDeltaMax   = 0.13,
		LowSpeedTractionLossMult = 0.0,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.44,
		TractionLossMult         = 0.9,

		-- Suspension
		SuspensionForce       = 2.0,
		SuspensionCompDamp    = 0.9,
		SuspensionReboundDamp = 1.8,
		SuspensionUpperLimit  = 0.1,
		SuspensionLowerLimit  = -0.18,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0.5,
		AntiRollBarBiasFront  = 0.65,
		RollCentreHeightFront = 0.4,
		RollCentreHeightRear  = 0.4,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 120.0,
		OilVolume					= 8.0,

		-- Misc
		SeatOffsetDistX = 0,
		SeatOffsetDistY = 0,
		SeatOffsetDistZ = 0,
		MonetaryValue   = 25000,
		ModelFlags		= '20840018',
		HandlingFlags   = "40000",
		DamageFlags		= "20",
		AIHandling		= "AVERAGE",

		SubHandling = {
			CCarHandlingData {

			}
		}
	},
	CHandlingData {
		
		HandlingName = "POLICET", -- Transport Van (112)
		-- Physical
		Mass               = 2500,
		InitialDragCoeff   = 2.59,
		PercentSubmerged   = 80,
		CentreOfMassOffset = { 0,    0, -0.015 },
		InertiaMultiplier  = { 1, 1.08,    1.24 },

		-- Transmission
		DriveBiasFront                 = 0,
		InitialDriveGears              = 4,
		InitialDriveForce              = 0.186,
		DriveInertia                   = 0.8,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 2.1,
		InitialDriveMaxFlatVel         = 134,
		SteeringLock                   = 35.0,

		-- Brake
		BrakeForce     = 0.64,
		BrakeBiasFront = 0.607,
		HandBrakeForce = 0.5,

		-- Traction
		TractionCurveMax         = 1.41,
		TractionCurveMin         = 1.2,
		TractionCurveLateral	 = 19.5,
		TractionSpringDeltaMax   = 0.15,
		LowSpeedTractionLossMult = 0.25,
		CamberStiffnesss		 = 0,
		TractionBiasFront        = 0.4834,
		TractionLossMult         = 1.02,

		-- Suspension
		SuspensionForce       = 1.74,
		SuspensionCompDamp    = 1.4,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.131,
		SuspensionLowerLimit  = -0.17,
		SuspensionRaise		  = 0,
		SuspensionBiasFront   = 0.5,
		AntiRollBarForce	  = 0,
		AntiRollBarBiasFront  = 0.55,
		RollCentreHeightFront = 0.58,
		RollCentreHeightRear  = 0.58,

		-- Damage
		CollisionDamageMult         = 1.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 2.0,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 60.0,
		OilVolume					= 6.5,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 150000,
		ModelFlags		= '444018',
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
		
		HandlingName = "2015POLSTANG", -- Ford Mustang (2001)
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
		InitialDriveForce              = 0.500,
		DriveInertia                   = 1.30,
		ClutchChangeRateScaleUpShift   = 1.8,
		ClutchChangeRateScaleDownShift = 2.4,
		InitialDriveMaxFlatVel         = 215,
		SteeringLock                   = 41.2,

		-- Brake
		BrakeForce     = 1.2641,
		BrakeBiasFront = 0.5573,
		HandBrakeForce = 0.77,

		-- Traction
		TractionCurveMax         = 2.09,
		TractionCurveMin         = 2.04,
		TractionCurveLateral	 = 14.4,
		TractionSpringDeltaMax   = 0.1,
		LowSpeedTractionLossMult = 0.79,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4789,
		TractionLossMult         = 1.3,

		-- Suspension
		SuspensionForce       = 1.82,
		SuspensionCompDamp    = 1.5,
		SuspensionReboundDamp = 0.4,
		SuspensionUpperLimit  = 0.157,
		SuspensionLowerLimit  = -0.165,
		SuspensionRaise		  = 0.05,
		SuspensionBiasFront   = 0.557,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.53,
		RollCentreHeightFront = 0.24,
		RollCentreHeightRear  = 0.25,

		-- Damage
		CollisionDamageMult         = 2.3,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 0.6,
		EngineDamageMult			= 1.4,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 35000,
		ModelFlags		= '440010',
		HandlingFlags   = "820102",
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
		
		HandlingName = "ghispo2", -- Maserati (2003)
		-- Physical
		Mass               = 1500,
		InitialDragCoeff   = 2.05,
		DownforceModifier  = 1.57,
		PercentSubmerged   = 74,
		CentreOfMassOffset = { 0,    -0.135, 0.03 },
		InertiaMultiplier  = { 1.18, 1,    1.89 },

		-- Transmission
		DriveBiasFront                 = 0.0,
		InitialDriveGears              = 6,
		InitialDriveForce              = 0.399,
		DriveInertia                   = 1.28,
		ClutchChangeRateScaleUpShift   = 1.9,
		ClutchChangeRateScaleDownShift = 2.5,
		InitialDriveMaxFlatVel         = 170,
		SteeringLock                   = 33.2,

		-- Brake
		BrakeForce     = 0.481,
		BrakeBiasFront = 0.3885,
		HandBrakeForce = 0.7,

		-- Traction
		TractionCurveMax         = 2.28,
		TractionCurveMin         = 2.111,
		TractionCurveLateral	 = 16.5,
		TractionSpringDeltaMax   = 0.142,
		LowSpeedTractionLossMult = 0.69,
		CamberStiffnesss		 = 0.0,
		TractionBiasFront        = 0.4823,
		TractionLossMult         = 1.31,

		-- Suspension
		SuspensionForce       = 3.14,
		SuspensionCompDamp    = 1.33,
		SuspensionReboundDamp = 0.59,
		SuspensionUpperLimit  = 0.0535,
		SuspensionLowerLimit  = -0.138,
		SuspensionRaise		  = 0.015,
		SuspensionBiasFront   = 0.454,
		AntiRollBarForce	  = 0.0,
		AntiRollBarBiasFront  = 0.6,
		RollCentreHeightFront = 0.332,
		RollCentreHeightRear  = 0.307,

		-- Damage
		CollisionDamageMult         = 4.0,
		WeaponDamageMult			= 1.0,
		DeformationDamageMult		= 12.0,
		EngineDamageMult			= 1.5,
		PetrolTankVolume			= 65.0,
		OilVolume					= 5.0,

		-- Misc
		SeatOffsetDistX = 0.0,
		SeatOffsetDistY = 0.0,
		SeatOffsetDistZ = 0.0,
		MonetaryValue   = 105000,
		ModelFlags		= '000010',
		HandlingFlags   = "0820102",
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
}
