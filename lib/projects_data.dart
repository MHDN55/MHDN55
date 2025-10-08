import 'generated/assets.dart';
import 'project.dart';

final List<Project> featuredProjects = [
  Project(
    name: 'Kleine',
    description:
        'E-commerce app with clean shopping UI, RESTful API integration, and smooth user experience.',
    tech: ['Flutter', 'Clean Architecture'],
    screens: [
      Assets.assetsECommerce1,
      Assets.assetsECommerce2,
      Assets.assetsECommerce3,
    ],
    playStore: '',
    github: 'https://github.com/MHDN55/e-commerce-app',
    isContribution: false,
  ),

  Project(
    name: 'Musicaly',
    description:
        'Online music streaming app — full project with smooth playback and BLoC state management.',
    tech: ['Flutter', 'Audio', 'BLoC'],
    screens: [
      Assets.assetsMusicaly1,
      Assets.assetsMusicaly2,
      Assets.assetsMusicaly3,
    ],
    playStore: '',
    github: 'https://github.com/MHDN55/musicaly',
    isContribution: false,
    role: 'Full development (UI, state management, and playback)',
  ),

  Project(
    name: 'Offers',
    description:
        'Local deals and offers app that displays categorized promotions with a clean UI and fast performance.',
    tech: ['Flutter', 'REST API', 'Bloc'],
    screens: [
      Assets.assetsOffers1,
      Assets.assetsOffers2,
      Assets.assetsOffers3,
      Assets.assetsOffers4,
    ],
    playStore: '',
    github: 'https://github.com/MHDN55/offers-app',
    isContribution: false,
    role:
        'Full development (UI design, API integration, and GetX state management)',
  ),

  Project(
    name: 'Swaqla',
    description:
        'Smart cleaning services app that allows users to book, schedule, and track cleaning requests easily.',
    tech: ['Flutter', 'Firebase', 'BLoC'],
    screens: [Assets.assetsSwaqla1, Assets.assetsSwaqla2, Assets.assetsSwaqla3],
    playStore: '',
    github: 'https://github.com/MHDN55/swaqla',
    isContribution: false,
    role: 'Full development (UI, authentication, and Firebase integration)',
  ),
];
final List<Project> contributedProjects = [
  Project(
    name: 'MTN Cash',
    description:
        'Mobile wallet and payment app — I contributed UI improvements and feature updates.',
    tech: ['Flutter', 'Payments'],
    screens: [
      Assets.assetsCashMobile1,
      Assets.assetsCashMobile2,
      Assets.assetsCashMobile3,
    ],
    playStore: 'https://cash.mtnsyr.com/',
    github: '',
    isContribution: true,
    role: 'UI updates, feature enhancements',
  ),

  Project(
    name: 'OEG (Our Easy Game)',
    description:
        'Freelance project — I contributed UI improvements and feature edits for this platform app.',
    tech: ['Flutter', 'UI/UX'],
    screens: [Assets.assetsOeg1, Assets.assetsOeg2, Assets.assetsOeg3],
    playStore: 'https://oureasygame.com/',
    github: '',
    isContribution: true,
    role: 'UI enhancements, feature edits',
  ),

  Project(
    name: 'SetAlkel',
    description: 'Local services listing & rating app (full project).',
    tech: ['Flutter', 'Firebase'],
    screens: [
      Assets.assetsSetalkel1,
      Assets.assetsSetalkel2,
      Assets.assetsSetalkel3,
    ],
    playStore:
        'https://play.google.com/store/apps/details?id=co.nonamegroup.setalkel&hl=en',
    github: '',
    isContribution: false,
  ),

  Project(
    name: 'Energy Gym',
    description:
        'Fitness and membership tracking app — I contributed to UI refinement and added workout scheduling features.',
    tech: ['Flutter', 'REST API'],
    screens: [
      Assets.assetsEnergyGym1,
      Assets.assetsEnergyGym2,
      Assets.assetsEnergyGym3,
    ],
    playStore: '',
    github: '',
    isContribution: true,
    role: 'UI improvements, feature integration',
  ),
];
