# frozen_string_literal: true

JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = SecureRandom.hex
