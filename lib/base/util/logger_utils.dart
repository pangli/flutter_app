import 'package:logger/logger.dart';

final Logger logger = Logger(
    printer: PrettyPrinter(
  methodCount: 0,
  errorMethodCount: 5,
  lineLength: 500,
  colors: true,
  printEmojis: true,
  dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
));
