import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class LogoAnimationBloc extends Bloc<LogoAnimationEvent, LogoAnimationState> {
  LogoAnimationBloc() : super(LogoAnimationInitial()) {
    on<AnimateLogo>(_onAnimateLogo);
  }

 final List<List<Offset>> _shapes = [
    // Pyramid
    [
      Offset(100, 60), // Top
      Offset(65, 135), // Bottom left
      Offset(135, 135), // Bottom right
      Offset(100, 115), // Middle
      Offset(100, 150), // Bottom middle
    ],
    // Cube
    [
      Offset(70, 70), // Top left front
      Offset(130, 70), // Top right front
      Offset(130, 130), // Bottom right front
      Offset(70, 130), // Bottom left front
      Offset(100, 100), // Center
    ],
    // Hexagon
    [
      Offset(100, 60), // Top
      Offset(135, 80), // Top right
      Offset(135, 120), // Bottom right
      Offset(100, 140), // Bottom
      Offset(65, 120), // Bottom left
      Offset(65, 80), // Top left
    ],
    // Top view of pyramid
    [
      Offset(100, 65), // Top
      Offset(65, 135), // Bottom left
      Offset(135, 135), // Bottom right
      Offset(100, 100), // Center
      Offset(100, 100), // Bottom middle
    ],
  ];

  int _currentShapeIndex = 0;
  List<Offset> _currentPositions = [];
  List<Offset> _targetPositions = [];

  void _onAnimateLogo(AnimateLogo event, Emitter<LogoAnimationState> emit) {
    if (_currentPositions.isEmpty) {
      _currentPositions = List.from(_shapes[0]);
      _targetPositions = List.from(_shapes[0]);
    }

    bool allReached = true;
    for (int i = 0; i < _currentPositions.length; i++) {
      _currentPositions[i] =
          _interpolatePosition(_currentPositions[i], _targetPositions[i], 0.04);
      if ((_currentPositions[i] - _targetPositions[i]).distance > 1) {
        allReached = false;
      }
    }

    emit(LogoAnimationUpdate(List.from(_currentPositions)));

    if (allReached) {
      _currentShapeIndex = (_currentShapeIndex + 1) % _shapes.length;
      _targetPositions = List.from(_shapes[_currentShapeIndex]);
    }
  }

  Offset _interpolatePosition(Offset current, Offset target, double t) {
    return Offset(
      current.dx + (target.dx - current.dx) * t,
      current.dy + (target.dy - current.dy) * t,
    );
  }
}

// Keep the rest of the file (event and state classes) unchanged

abstract class LogoAnimationEvent extends Equatable {
  const LogoAnimationEvent();

  @override
  List<Object> get props => [];
}

class AnimateLogo extends LogoAnimationEvent {}

abstract class LogoAnimationState extends Equatable {
  const LogoAnimationState();

  @override
  List<Object> get props => [];
}

class LogoAnimationInitial extends LogoAnimationState {}

class LogoAnimationUpdate extends LogoAnimationState {
  final List<Offset> dotPositions;

  const LogoAnimationUpdate(this.dotPositions);

  @override
  List<Object> get props => [dotPositions];
}
