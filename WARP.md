# WARP.md

This file provides guidance to WARP (warp.dev) when working with code in this repository.

## Repository overview
- Purpose (from README): Java performance benchmark demonstrating how execution time grows when concatenating strings.
- Current state: Only `README.md` is present; there is no Java source, build tool configuration, or tests yet.

## Commands
Because no build tool is configured yet, there are no build/lint/test commands to run at this time.

When build tooling is added, use the following, based on what files exist:

- If `pom.xml` or `mvnw*` exists (Maven):
  - Build (skip tests): `./mvnw -q -DskipTests package` (Windows PowerShell: `mvnw.cmd -q -DskipTests package`)
  - Run tests: `./mvnw -q test`
  - Run a single test: `./mvnw -q -Dtest=FullyQualifiedClassName#methodName test`
  - Lint (only if plugin is configured):
    - Checkstyle: `./mvnw -q checkstyle:check`
    - Spotless: `./mvnw -q spotless:apply` or `./mvnw -q spotless:check`

- If `build.gradle*` or `gradlew*` exists (Gradle):
  - Build: `./gradlew build`
  - Run tests: `./gradlew test`
  - Run a single test: `./gradlew test --tests FullyQualifiedClassName.methodName`
  - Lint (only if plugin is configured):
    - Spotless: `./gradlew spotlessApply` / `./gradlew spotlessCheck`
    - Checkstyle: `./gradlew checkstyleMain checkstyleTest`

- If JMH is added:
  - Gradle (with JMH plugin): `./gradlew jmh`
  - Maven (shaded JAR): `./mvnw -q -DskipTests package` then `java -jar target/benchmarks.jar`

## Architecture and structure
- Not yet established. When Java code is added, follow conventional layout so agents can navigate easily:
  - Application code: `src/main/java/...`
  - Tests: `src/test/java/...`
  - Benchmark fixtures (if JMH): `src/jmh/java/...` or regular sources annotated with `@Benchmark`.

## What Warp should check on entry
1. Detect build tool by the presence of `pom.xml`/`mvnw*` (Maven) or `build.gradle*`/`gradlew*` (Gradle).
2. If tests exist under `src/test/java`, prefer the “single test” commands above during iteration.
3. If JMH annotations (`@Benchmark`) are present, prefer the JMH commands above for performance runs.

## Notes from README
- Project intent: benchmark string concatenation to learn about efficiency and memory management. Expand this file with concrete commands once the build tool and code are added.
